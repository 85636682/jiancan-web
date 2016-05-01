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
      post '', serializer: CouponUserSerializer, root: false do
        authenticate!
        @coupon_user = CouponUser.find_by(user_id: current_user.id, coupon_id: params[:coupon_id], used: false)
        error!({ error: "你已经获取该优惠劵！" }, 400) unless @coupon_user.blank?
        @coupon_user = CouponUser.new(user_id: current_user.id,
                                      coupon_id: params[:coupon_id],
                                      random_code: SecureRandom.hex(8))
        if @coupon_user.save
          render @coupon_user
        else
          error!({ error: "获取优惠劵失败！" }, 400)
        end
      end

      params do
        requires :coupon_id, type: Integer, desc: "coupon_id"
      end
      get 'check' do
        authenticate!
        @coupon_user = current_user.coupon_users.where(:coupon_id => params[:coupon_id], :used => false).first
        unless @coupon_user.blank?
          { result_code: "SUCCESS" }
        else
          { result_code: "FAIL" }
        end
      end

    end
  end
end
