webpackJsonp([7],{34:function(e,t){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t["default"]={data:function(){return{order:{}}},route:{data:function(e){this.$http.get("http://jiancan.me/api/u1/orders/one.json",{order_id:this.$route.params.order_id}).then(function(t){e.next({order:t.data})},function(e){this.$dispatch("response-msg",e)})}}}},66:function(e,t){e.exports='<navigation-bar> <div slot=middle_content> 我的订单 </div> </navigation-bar> <div class=page> <div class=bd> <div class=weui_cells_title>带说明的列表项</div> <div class=weui_cells> <div class=weui_cell> <div class="weui_cell_bd weui_cell_primary"> <p>编号</p> </div> <div class=weui_cell_ft>{{order.sn}}</div> </div> </div> </div> </div>'},77:function(e,t,i){var s,o;s=i(34),o=i(66),e.exports=s||{},e.exports.__esModule&&(e.exports=e.exports["default"]),o&&(("function"==typeof e.exports?e.exports.options||(e.exports.options={}):e.exports).template=o)}});
//# sourceMappingURL=7.4c668cf862e0770a348b.js.map