module V1
  class CouponUsers < Grape::API
    resource :coupon_users do

      params do
      end
      get '', each_serializer: CouponUserSerializer, root: false do
        authenticate!
        current_worker.shop.coupon_users.order("created_at DESC")
      end

      params do
        requires :coupon_user_id, type: Integer, desc: "coupon_user_id"
      end
      get 'one', serializer: CouponUserSerializer, root: false do
        authenticate!
        CouponUser.find_by_id(params[:coupon_user_id])
      end

    end
  end
end
