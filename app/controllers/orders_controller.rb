class OrdersController < ApplicationController
  layout false

  skip_before_filter :verify_authenticity_token

  def pay_notify
    JcLog.create(:content => "1")
    result = Hash.from_xml(request.body.read)["xml"]
    if WxPay::Sign.verify?(result)
      JcLog.create(:content => "2")
      @order = Order.find_by_id(result["out_trade_no"])
      unless @order.blank?
        JcLog.create(:content => "3")
        if @order.status.pending?
          JcLog.create(:content => "4")
          @order.payed
          @order.update_attributes(:collect => result["total_fee"])
        end
      end
      render :xml => { return_code: "SUCCESS" }.to_xml(root: 'xml', dasherize: false)
    else
      JcLog.create(:content => "5")
      render :xml => { return_code: "FAIL", return_msg: "" }.to_xml(root: 'xml', dasherize: false)
    end
  end

end
