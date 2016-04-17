module U1
  class Pay < Grape::API
    resource :pay do

      desc '支付订单'
      params do
        requires :order_id, type: Integer, desc: '订单id'
      end
      get '' do
        authenticate!
        @order = Order.find_by_id(params[:order_id])
        error!({ error: "订单不存在！" }, 400) if @order.blank?
        error!({ error: "订单已支付！"}, 400) if @order.completed?
        error!({ error: "用户未授权！"}, 400) if current_user.weixin_open_id.blank?
        params = {
          body: "在#{@order.shop.name}消费了#{@order.total_price}元",
          out_trade_no: @order.sn,
          total_fee: @order.total_price,
          spbill_create_ip: '120.55.164.64',
          notify_url: 'http://www.jiancan.me/weixin/pay_notify',
          trade_type: 'JSAPI', # could be "JSAPI", "NATIVE" or "APP",
          openid: "#{current_user.weixin_open_id}" # required when trade_type is `JSAPI`
        }
        r = WxPay::Service.invoke_unifiedorder params
        # => {
        #      "return_code"=>"SUCCESS",
        #      "return_msg"=>"OK",
        #      "appid"=>"YOUR APPID",
        #      "mch_id"=>"YOUR MCH_ID",
        #      "nonce_str"=>"8RN7YfTZ3OUgWX5e",
        #      "sign"=>"623AE90C9679729DDD7407DC7A1151B2",
        #      "result_code"=>"SUCCESS",
        #      "prepay_id"=>"wx2014111104255143b7605afb0314593866",
        #      "trade_type"=>"JSAPI"
        # }
        if r.success? # => true
          r
        else
          { "return_code" => "FAIL", "err_code" => r.err_code, "err_code_des" => r.err_code_des }
        end
      end

    end
  end
end