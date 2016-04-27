module U1
  class CouponUsers < Grape::API
    resource :coupon_users do

      params do
      end
      get '', each_serializer: CouponUserSerializer, root: false do
        authenticate!
        current_user.coupon_users.where(:used => false).order("created_at DESC")
      end

      params do
        requires :coupon_user_id, type: Integer, desc: "coupon_user_id"
      end
      get 'one', serializer: CouponUserSerializer, root: false do
        authenticate!
        CouponUser.find_by_id(params[:coupon_user_id])
      end

      params do
        requires :coupon_id, type: Integer, desc: "coupon_id"
      end
      get 'check', serializer: CouponUserSerializer, root: false do
        authenticate!
        @coupon_user = current_user.coupon_users.where(:coupon_id => params[:coupon_id], :used => false).first
        if @coupon_user.blank?
          { result_code: "SUCCESS" }
        else
          { result_code: "FAIL" }
        end
      end

    end
  end
end
