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
          total_fee: (@order.total_price * 100).to_i,
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
        JcLog.create(:content => r)
        if r.success? # => true
          package = "prepay_id=#{r["prepay_id"]}"
          JcLog.create(:content => package)
          paySign = Digest::MD5.hexdigest("appId=#{r["appid"]}&timeStamp=#{Time.now.to_i.to_s}&nonceStr=#{SecureRandom.uuid.tr('-', '')}&package=#{package}&signType=MD5").upcase
          JcLog.create({ "prepay_id" => r["prepay_id"], "nonceStr" => "#{SecureRandom.uuid.tr('-', '')}", "paySign" => "#{paySign}", "return_code" => r["return_code"], "return_msg" => r["return_msg"] })
          { "prepay_id" => r["prepay_id"], "nonceStr" => "#{SecureRandom.uuid.tr('-', '')}", "paySign" => "#{paySign}", "return_code" => r["return_code"], "return_msg" => r["return_msg"] }
        else
          { "return_code" => "FAIL", "return_msg" => r["return_msg"] }
        end
      end

    end
  end
end
