module U1
  class Favorites < Grape::API
    resource :favorites do
      desc "获取用户喜爱的店铺"
      params do
      end
      get 'shops', each_serializer: ShopSerializer, root: false do
        authenticate!
        @shops = current_user.favorite_shops
      end

      desc "添加用户喜爱的店铺"
      params do
        requires :shop_id, type: Integer, desc: "店铺id"
      end
      post 'shops' do
        authenticate!
        @favorite = Favorite.where(:user_id => current_user.id, :favoriteable_id => params[:shop_id], :favoriteable_type => "Shop").first
        if @favorite.blank?
          @favorite = Favorite.new(:user_id => current_user.id, :favoriteable_id => params[:shop_id], :favoriteable_type => "Shop")
          if @favorite.save
            { msg: '已收藏！', isFavorited: true }
          else
            error!({ error: "收藏失败！" }, 400)
          end
        else
          if @favorite.destroy
            { msg: '取消收藏！', isFavorited: false }
          else
            error!({ error: "取消收藏失败！" }, 400)
          end
        end
      end

      desc "是否已收藏"
      params do
        requires :shop_id, type: Integer, desc: "店铺id"
      end
      get 'is_favorited' do
        authenticate!
        @favorite = Favorite.where(:user_id => current_user.id, :favoriteable_id => params[:shop_id], :favoriteable_type => "Shop").first
        if @favorite.blank?
          { isFavorited: false }
        else
          { isFavorited: true }
        end
      end

    end
  end
end
