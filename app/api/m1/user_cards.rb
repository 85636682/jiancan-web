module M1
  class UserCards < Grape::API
    resource :user_cards do

      desc "创建会员卡"
      params do
        requires :user_card, type: Hash do
          requires :title, type: String, desc: "卡券名"
          requires :prerogative, type: String, desc: "特权说明"
          requires :notice, type: String, desc: "使用提醒"
          requires :description, type: String, desc: "使用说明"
          requires :service_phone, type: String, desc: "服务电话"
          optional :brand_name, type: String, desc: ""
          optional :color, type: String, desc: ""
          optional :sku, type: String, desc: ""
          optional :date_info, type: String, desc: ""
        end
      end
      post "", serializer: UserCardSerializer, root: false do
        authenticate!
        @user_card = UserCard.new(params[:user_card])
        @user_card.shop_id = current_merchant.shop.id
        if @user_card.save
          render @user_card
        else
          error!({ error: "保存失败！" }, 400)
        end
      end

      desc "获取单一会员卡"
      params do
        requires :user_card_id, type: Integer, desc: "会员卡id"
      end
      get 'one', each_serializer: UserCardSerializer, root: false do
        authenticate!
        @user_card = UserCard.find_by_id(params[:user_card_id])
      end

      desc "更新会员卡"
      params do
        requires :user_card_id, type: Integer, desc: "会员卡id"
        requires :user_card, type: Hash do
          optional :brand_name, type: String, desc: "商店名"
          optional :title, type: String, desc: "卡券名"
          optional :color, type: String, desc: ""
          optional :prerogative, type: String, desc: "特权说明"
          optional :notice, type: String, desc: "使用提醒"
          optional :description, type: String, desc: "使用说明"
          optional :service_phone, type: String, desc: ""
          optional :sku, type: String, desc: ""
          optional :date_info, type: String, desc: ""
          optional :logo, type: Hash, desc: ""
          optional :bonus_rules, type: String, desc: "积分规则"
          optional :bonus_cleared, type: String, desc: "积分清零规则"
          optional :balance_rules, type: String, desc: "储值说明"
          optional :cost_money_unit, type: Integer, desc: "消费金额。以分为单位。"
          optional :increase_bonus, type: Integer, desc: "对应增加的积分。"
          optional :max_increase_bonus, type: Integer, desc: "用户单次可获取的积分上限。"
          optional :init_increase_bonus, type: Integer, desc: "初始设置积分"
          optional :cost_bonus_unit, type: Integer, desc: "每使用5积分。"
          optional :reduce_money, type: Integer, desc: "抵扣xx元，（这里以分为单位）"
          optional :least_money_to_use_bonus, type: Integer, desc: "抵扣条件，满xx元（这里以分为单位）可用。"
          optional :max_reduce_bonus, type: Integer, desc: "抵扣条件，单笔最多使用xx积分。"
          optional :discount, type: Integer, desc: "折扣，该会员卡享受的折扣优惠,填10就是九折。"
        end
      end
      put 'one' do
        authenticate!
        @user_card = UserCard.find_by_id(params[:user_card_id])
        error!({ error: "会员卡不存在！" }, 400) if @user_card.blank?
        if @user_card.update_attributes(params[:user_card])
          render @user_card
        else
          error!({ error: "更新失败！" }, 400)
        end
      end

      desc "删除会员卡"
      params do
        requires :user_card_id, type: Integer, desc: "会员卡id"
      end
      delete 'one' do
        authenticate!
        @user_card = UserCard.find_by_id(params[:user_card_id])
        error!({ error: "会员卡不存在！" }, 400) if @user_card.blank?
        if @user_card.destroy
          { msg: 'ok' }
        else
          error!({ error: "删除失败！" }, 400)
        end
      end

      desc "同步到微信"
      params do
        requires :user_card_id, type: Integer, desc: "会员卡id"
      end
      get 'push' do
        authenticate!
        @user_card = UserCard.find_by_id(params[:user_card_id])
        error!({ error: "会员卡不存在！" }, 400) if @user_card.blank?
        app_id = @user_card.shop.shop_public_accout.app_id
        app_secret = @user_card.shop.shop_public_accout.app_secret
        error!({ error: "还未绑定公众号！" }, 400) if app_id.blank? || app_secret.blank?
        client = WeixinAuthorize::Client.new(app_id, app_secret)
        helper = WeixinAuthorize::CardJsonHelper
        base_info = helper.base_info({logo_url: logo_url, code_type: 'CODE_TYPE_TEXT',
                      brand_name: @user_card.shop.name, title: @user_card.title,
                      color: 'Color010', notice: @user_card.notice,
                      description: @user_card.description, service_phone: @user_card.service_phone,
                      sku: helper.sku("#{current_merchant.id}#{@user_card.shop.id}#{@user_card.id}".to_i),
                      date_info: helper.date_info('DATE_TYPE_FIX_TERM', nil, nil, 0, 30)})
        bonus = helper::MemberCard.bonus(true, 'http://www.example.com', @user_card.bonus_cleared, @user_card.bonus_rules)
        balance = helper::MemberCard.balance(true, 'http://www.example.com', @user_card.balance_rules)
        card = helper::MemberCard.create(base_info,
                                          { prerogative: @user_card.prerogative,
                                            bonus: bonus, balance: balance
                                          }
                                        )
        if client.card_create(card)
          { msg: 'ok' }
        else
          error!({ error: "删除失败！" }, 400)
        end
      end

    end
  end
end
