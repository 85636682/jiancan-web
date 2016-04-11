module M1
  class Orders < Grape::API
    resource :orders do
      desc '获取单一订单数据'
      params do
        requires :order_id, type: Integer, desc: '订单id'
      end
      get 'one', serializer: OrderDetailSerializer, root: false do
        @order = Order.find_by_id(params[:order_id])
      end

      desc '根据订单号SN搜索订单'
      params do
        requires :sn, type: String, desc: '订单编号'
      end
      get 'search', serializer: OrderDetailSerializer, root: false do
        @order = Order.find_by_sn(params[:sn])
      end

      desc '删除订单'
      params do
        requires :order_id, type: Integer, desc: "订单id"
      end
      delete 'one' do
        @order = Order.find_by_id(params[:order_id])
        error!({ error: "订单不存在！" }, 400) if @order.blank?
        if @order.destroy
          { msg: 'ok' }
        else
          error!({ error: "删除失败！" }, 400)
        end
      end
    end
  end
end
