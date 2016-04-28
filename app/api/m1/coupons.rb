module M1
  class Coupons < Grape::API
    resource :coupons do

      desc '创建优惠卷'
      params do
        requires :coupon, type: Hash do
          requires :title, type: String
          requires :details, type: String
          requires :original_price, type: Float
          requires :preferential_price, type: Float
        end
      end
      post '', serializer: CouponSerializer, root: false do
        authenticate!
        @coupon = Coupon.new(params[:coupon])
        @coupon.shop_id = current_merchant.shop.id
        if @coupon.save
          render @coupon
        else
          error!({ error: "保存失败！" }, 400)
        end
      end

      desc '更新优惠卷'
      params do
        requires :coupon_id, type: Integer, desc: "优惠卷id"
        requires :coupon, type: Hash do
          optional :title, type: String
          optional :details, type: Integer
          optional :original_price, type: Float
          optional :preferential_price, type: Float
          optional :avatar, type: Hash
        end
      end
      put 'one', serializer: CouponDetailSerializer, root: false do
        @coupon = Coupon.find_by_id(params[:coupon_id])
        error!({ error: "优惠卷不存在！" }, 400) if @coupon.blank?
        if @coupon.update_attributes(params[:coupon])
          render @coupon
        else
          error!({ error: "更新失败！" }, 400)
        end
      end

      desc '删除优惠卷'
      params do
        requires :coupon_id, type: Integer, desc: "优惠卷id"
      end
      delete 'one' do
        @coupon = Coupon.find_by_id(params[:coupon_id])
        error!({ error: "优惠卷不存在！" }, 400) if @coupon.blank?
        if @coupon.destroy
          { msg: 'ok' }
        else
          error!({ error: "删除失败！" }, 400)
        end
      end

      desc '返回某个优惠卷'
      params do
        requires :coupon_id, type: Integer, desc: "优惠卷id"
      end
      get 'one', serializer: CouponDetailSerializer, root: false do
        authenticate!
        @coupon = Coupon.find_by_id(params[:coupon_id])
      end

      desc "添加活动商品"
      params do
        requires :coupon_id, type: Integer, desc: '优惠劵的id'
        requires :products, type: String, desc: '商品id数组'
      end
      post "products", serializer: CouponDetailSerializer, root: false do
        authenticate!
        @coupon = Coupon.find_by_id(params[:coupon_id])
        if @coupon.blank?
          error!({ error: "优惠劵不存在！" }, 400)
        else
          begin
            ActiveRecord::Base.transaction do
              params[:products].split(',').each do |value|
                next if value.to_i < 1
                product = Product.find_by_id(value)
                if not product.blank?
                  coupon_product = CouponProduct.where(:coupon_id => @coupon.id, :product_id => product.id).first
                  if coupon_product.blank?
                    coupon_product = CouponProduct.create!(:coupon_id => @coupon.id, :product_id => product.id, :amount => 1)
                  else
                    amount = coupon_product.amount + 1
                    coupon_product.update_attributes!(:amount => amount)
                  end
                end
              end
            end
            render @coupon
          rescue Exception => e
            error!({ error: "商品失效，导致添加失败！" }, 400)
          end

        end
      end

    end
  end
end
