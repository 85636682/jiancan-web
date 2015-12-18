module U1
  class Shops < Grape::API
    resource :shops do
      desc '根据地理定位返回周边的店铺，经纬度和文字性地址必须一个不为空，经纬度不需要为0，'
      params do
        requires :lat, type: Float, desc: "经度"
        requires :lng, type: Float, desc: "维度"
        requires :address, type: String, desc: "文字性地址"
      end
      get '', each_serializer: ShopSerializer, root: false do
        authenticate!
        @shops = []
        if params[:address].blank?
          @shops = Shop.select("shops.*, st_distance(location, 'point(#{params[:lng]} #{params[:lat]})') as distance")
              .where("st_dwithin(location, 'point(#{params[:lng]} #{params[:lat]})', 10000)").order("distance")
          # 查找10公里 内结果， 并按照距离进行排序
        else
          response = RestClient.get Addressable::URI.parse("http://api.map.baidu.com/geocoder/v2/" +
                                    "?ak=#{Setting.baidu_map_ak}" +
                                    "&output=json" +
                                    "&address=#{params[:address]}").normalize.to_str
          result = JSON.parse(response.force_encoding("UTF-8").gsub(/[\u0011-\u001F]/, ""))
          if result["status"] == 0
            @shops = Shop.select("shops.*, st_distance(location, 'point(#{result["result"]["location"]["lng"]} #{result["result"]["location"]["lat"]})') as distance")
                .where("st_dwithin(location, 'point(#{result["result"]["location"]["lng"]} #{result["result"]["location"]["lat"]})', 10000)").order("distance")
          end
        end
        render @shops
      end

      desc '获取某店铺下所有分类'
      params do
        requires :shop_id, type: Integer, desc: '店铺id'
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get 'categories', each_serializer: CategorySerializer, root: false do
        authenticate!
        @categories = Category.where(:shop_id => params[:shop_id]).offset(params[:offset]).limit(params[:limit]).order("id ASC")
      end

      desc '获取某店铺下所有商品'
      params do
        requires :shop_id, type: Integer, desc: '店铺id'
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get 'products', each_serializer: ProductSerializer, root: false do
        authenticate!
        @products = Product.where(:shop_id => params[:shop_id]).offset(params[:offset]).limit(params[:limit]).order("id ASC")
      end

    end
  end
end
