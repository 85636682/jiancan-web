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
        error!({ error: "订单已支付或货到付款！"}, 400) if not @order.can_pay?
        error!({ error: "用户未授权！"}, 400) if current_user.weixin_open_id.blank?
        params = {
          body: "在#{@order.shop.name}消费了#{@order.total_fee}元",
          out_trade_no: @order.sn,
          total_fee: (@order.total_fee * 100).to_i,
          spbill_create_ip: '120.55.164.64',
          notify_url: 'http://www.jiancan.me/pay_notify',
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
          timeStamp = Time.now.to_i.to_s
          nonceStr = SecureRandom.uuid.tr('-', '')
          params = {
            appId: r['appid'],
            timeStamp: timeStamp,
            nonceStr: nonceStr,
            package: "prepay_id=#{r['prepay_id']}",
            signType: 'MD5'
          }
          paySign = WxPay::Sign.generate(params)
          { "prepay_id" => r["prepay_id"], "timeStamp" => timeStamp, "nonceStr" => nonceStr, "paySign" => paySign, "return_code" => r["return_code"], "return_msg" => r["return_msg"] }
        else
          { "return_code" => r["return_code"], "return_msg" => r["return_msg"], "result_code" => r["result_code"], "err_code" => r["err_code"], "err_code_des" => r["err_code_des"] }
        end
      end

      desc '支付宝支付订单'
      params do
        requires :order_id, type: Integer, desc: '订单id'
      end
      get 'alipay' do
        authenticate!
        @order = Order.find_by_id(params[:order_id])
        error!({ error: "订单不存在！" }, 400) if @order.blank?
        error!({ error: "订单已支付或货到付款！"}, 400) if not @order.can_pay?
        Alipay::Service.create_direct_pay_by_user_wap_url({
          out_trade_no: '20150401000-0001',
          subject: 'Order Name',
          total_fee: '10.00',
          return_url: 'https://example.com/orders/20150401000-0001',
          notify_url: 'https://example.com/orders/20150401000-0001/notify'
        }, {
          pid: 'ANOTHER_PID',
          key: 'ANOTHER_KEY',
        })
      end

    end
  end
end
