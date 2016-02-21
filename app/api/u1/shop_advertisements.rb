module U1
  class ShopAdvertisements < Grape::API
    resource :shop_advertisements do

      desc "记录转发次数"
      params do
        requires :shop_advertisement_id, type: Integer, desc: "广告id"
      end
      put 'forwarding' do
        authenticate!
        @shop_advertisement_user = ShopAdvertisementUser.where(
                                      shop_advertisement_id: params[:shop_advertisement_id],
                                      user_id: current_user.id).first
        error!({ error: "广告不存在！" }, 400) if @shop_advertisement_user.blank?
        if @shop_advertisement_user.update_attributes(:forwarding_times => @shop_advertisement_user.forwarding_times + 1)
          render @shop_advertisement_user
        else
          error!({ error: "更新失败！" }, 400)
        end
      end

    end
  end
end
