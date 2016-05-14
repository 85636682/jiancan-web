webpackJsonp([19],{1:function(t,o){"use strict";Object.defineProperty(o,"__esModule",{value:!0}),o["default"]={methods:{GoBack:function(){this.$route.router.go(window.history.back())}}}},2:function(t,o){t.exports='<div class="navbar navbar-light bg-faded navigation"> <a class="nav-link btn btn-primary-outline btn-sm" @click=GoBack> <i class="fa fa-arrow-left"></i> 返回 </a> <slot name=title></slot> <slot name=right-content></slot> </div>'},3:function(t,o,e){var r,d;r=e(1),d=e(2),t.exports=r||{},t.exports.__esModule&&(t.exports=t.exports["default"]),d&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=d)},80:function(t,o,e){"use strict";Object.defineProperty(o,"__esModule",{value:!0});var r=e(4);o["default"]={vuex:{getters:{isLogged:function(t){return t.merchant.isLogged},access_token:function(t){return t.merchant.merchant.access_token}},actions:{showAlert:r.showAlert,showLoading:r.showLoading,hideLoading:r.hideLoading}},data:function(){return{order:{}}},route:{data:function(t){this.showLoading();var o=this.$route.params;this.$http.get("http://jiancan.me/api/m1/orders/one.json",{access_token:this.access_token,order_id:o.order_id}).then(function(o){t.next({order:o.data})},function(t){this.showAlert(t.data.error)}),this.hideLoading()}},components:{"nav-bar":e(3)}}},116:function(t,o){t.exports='<nav-bar> <span slot=title class=title>订单详情</span> </nav-bar> <table class=table> <tbody> <tr> <td> 订单号：{{order.sn}} </td> <td>总额：￥{{order.total_price}}</td> <td>实收：¥{{order.collect}}</td> <td> 状态：{{order.status_text}} </td> </tr> <tr> <td colspan=4> <table class=table> <thead> <th>#</th> <th>图片</th> <th>名称</th> <th>单价</th> <th>数量</th> <th>状态</th> </thead> <tbody> <tr v-for="order_product in order.order_products"> <td>{{order_product.id}}</td> <td> <img alt=店铺头像 class=img-circle width=40 height=40 v-bind:src=order_product.product.avatar /> </td> <td>{{order_product.product.name}}</td> <td>¥ {{order_product.product.price}}</td> <td>{{order_product.quantity}}</td> <td>{{order_product.status_text}}</td> </tr> </tbody> </table> </td> </tr> </tbody> </table>'},144:function(t,o,e){var r,d;r=e(80),d=e(116),t.exports=r||{},t.exports.__esModule&&(t.exports=t.exports["default"]),d&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=d)}});
//# sourceMappingURL=19.28eb1b9843460a001eec.js.map