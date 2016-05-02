class OrdersController < ApplicationController
  layout false

  skip_before_filter :verify_authenticity_token

  def pay_notify
    result = Hash.from_xml(request.body.read)["xml"]
    if WxPay::Sign.verify?(result)
      @order = Order.find_by_sn(result["out_trade_no"])
      unless @order.blank?
        if @order.can_pay?
          @order.update_attributes(:status => 'pending', :collect => result["total_fee"])
        end
      end
      render :xml => { return_code: "SUCCESS" }.to_xml(root: 'xml', dasherize: false)
    else
      render :xml => { return_code: "FAIL", return_msg: "" }.to_xml(root: 'xml', dasherize: false)
    end
  end

end
