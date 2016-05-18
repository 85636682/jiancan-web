module V1
  class Pay < Grape::API
    resource :pay do

      params do
        requires :platform, type: String, desc: '平台名称，微信=wechat，支付宝=alipay'
        requires :order_id, type: Integer, desc: '支付订单id'
      end
      get '' do
        @order = Order.find_by_id(params[:order_id])
        error!({ error: "订单不存在！" }, 400) if @order.blank?
        error!({ error: "订单未结算！"}, 400) if not @order.status.settled?
        error!({ error: "订单已完成支付！"}, 400) if @order.status.completed?
        if params[:platform] == 'wechat'
          fields = {
            body: "在#{@order.shop.name}消费了#{@order.total_fee}元",
            out_trade_no: @order.sn,
            total_fee: (@order.total_fee * 100).to_i,
            spbill_create_ip: '120.55.164.64',
            notify_url: 'http://www.jiancan.me/pay_notify',
            trade_type: 'NATIVE'
          }
          r = WxPay::Service.invoke_unifiedorder fields
          if r.success?
            { msg: 'ok', code_url: r["code_url"] }
          else
            error!({ error: "支付出错，请联系管理员！"}, 400)
          end
        end
      end
    end
  end
end
