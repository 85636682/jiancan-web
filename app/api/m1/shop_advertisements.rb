module M1
  class ShopAdvertisements < Grape::API
    resource :shop_advertisements do

      desc "创建广告"
      params do
        requires :shop_advertisement, type: Hash do
          requires :title, type: String
          requires :content, type: String
          requires :divide_into, type: Float
        end
      end
      post '', serializer: ShopAdvertisementSerializer, root: false  do
        authenticate!
        @shop_advertisement = ShopAdvertisement.new(params[:shop_advertisement])
        @shop_advertisement.shop_id = current_merchant.shop.id
        if @shop_advertisement.save
          render @shop_advertisement
        else
          error!({ error: "保存失败！" }, 400)
        end
      end

      desc "获取单一广告"
      params do
        requires :shop_advertisement_id, type: Integer, desc: "广告id"
      end
      get 'one', each_serializer: ShopAdvertisementSerializer, root: false do
        authenticate!
        @shop_advertisement = ShopAdvertisement.find_by_id(params[:shop_advertisement_id])
      end

      desc "更新广告"
      params do
        requires :shop_advertisement, type: Hash do
          optional :title, type: String
          optional :content, type: String
          optional :divide_into, type: Float
        end
      end
      put 'one' do
        @shop_advertisement = ShopAdvertisement.find_by_id(params[:shop_advertisement_id])
        error!({ error: "广告不存在！" }, 400) if @shop_advertisement.blank?
        if @shop_advertisement.update_attributes(params[:shop_advertisement])
          render @shop_advertisement
        else
          error!({ error: "更新失败！" }, 400)
        end
      end

      desc "删除广告"
      params do
        requires :shop_advertisement_id, type: Integer, desc: "广告id"
      end
      delete 'one' do
        @shop_advertisement = ShopAdvertisement.find_by_id(params[:shop_advertisement_id])
        error!({ error: "广告不存在！" }, 400) if @shop_advertisement.blank?
        if @shop_advertisement.destroy
          { msg: 'ok' }
        else
          error!({ error: "删除失败！" }, 400)
        end
      end

    end
  end
end
