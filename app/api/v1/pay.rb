module V1
  class Pay < Grape::API
    resource :pay do

      params do
        requires :platform, type: String, desc: '平台名称'
        requires :trade_type, type: String, desc: '支付方式'
        requires :order_id, type: Integer, desc: '支付订单id'
      end
      get '' do
        authenticate!
        @order = Order.find_by_id(params[:order_id])
        error!({ error: "订单不存在！" }, 400) if @order.blank?
        error!({ error: "订单已完成支付！"}, 400) if @order.status.completed?
        if params[:platform] == 'wechat'
          fields = {
            appid: '',
            mch_id: '',
            sub_appid: '',
            sub_mch_id: '',
            body: "在#{@order.shop.name}消费了#{@order.total_price}元",
            out_trade_no: @order.sn,
            total_fee: @order.total_price,
            spbill_create_ip: '120.55.164.64',
            notify_url: 'http://www.jiancan.me/weixin/pay_notify',
            trade_type: 'NATIVE'
          }
          r = WechatPay::Service.invoke_unifiedorder fields
          error!({ error: "网络出错，请联系管理员！"}, 400) if r == nil
          error!({ error: "支付出错，请联系管理员！"}, 400) unless r.success?
          { msg: 'ok', code_url: r["code_url"] }
        end
      end
    end
  end
end
