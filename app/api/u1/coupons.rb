module U1
  class Coupons < Grape::API
    resource :coupons do

      desc '返回店铺下所有会员卡'
      params do
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get '', each_serializer: CouponSerializer, root: false do
        @coupons = Coupon.all.offset(params[:offset]).limit(params[:limit]).order("coupon_users_count DESC")
        render @coupons
      end

      desc '返回某个优惠卷'
      params do
        requires :coupon_id, type: Integer, desc: "优惠卷id"
      end
      get 'one', serializer: CouponDetailSerializer, root: false do
        @coupon = Coupon.find_by_id(params[:coupon_id])
      end

    end
  end
end
