module V1
  class Coupons < Grape::API
    resource :coupons do

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
