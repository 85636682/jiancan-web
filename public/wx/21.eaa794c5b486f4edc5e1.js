webpackJsonp([21],{42:function(e,s){"use strict";Object.defineProperty(s,"__esModule",{value:!0}),s["default"]={data:function(){return{successTag:!1,iconSuccess:"weui_icon_success",iconWarn:"weui_icon_warn",msg:"",extraMsg:"3秒后没发生跳转，请点击上面的按钮"}},computed:{isSuccess:function(){return!this.successTag},showMsg:function(){return this.successTag?"授权成功":"授权失败"}},methods:{goRequestUrl:function(){var e=this.$route.query.request_url;null!=e&&void 0!==e||(e="profile"),"check"===e?self.$route.router.go({name:e,query:{shop_id:self.$route.query.shop_id,express:this.$route.query.express}}):"coupon"===e?self.$route.router.go({name:e,params:{coupon_id:self.$route.query.coupon_id}}):self.$route.router.go({name:e})}},ready:function(){var e=this.$route.query.access_token;null==e||void 0===e?this.successTag=!1:(this.successTag=!0,localStorage.setItem("jc_user_access_token",e));var s=this.$route.query.request_url;null!=s&&void 0!==s||(s="profile");var o=this;setTimeout(function(){"check"===s?o.$route.router.go({name:s,query:{shop_id:o.$route.query.shop_id}}):"coupon"===s?o.$route.router.go({name:s,params:{coupon_id:o.$route.query.coupon_id}}):o.$route.router.go({name:s})},1e3)}}},103:function(e,s){e.exports='<div class=page> <div class=weui_msg> <div class=weui_icon_area><i class=weui_icon_msg v-bind:class="[ successTag ? iconSuccess : iconWarn ]"></i></div> <div class=weui_text_area> <h2 class=weui_msg_title>{{showMsg}}</h2> <p class=weui_msg_desc>{{showExtraMsg}}</p> </div> <div class=weui_opr_area> <p class=weui_btn_area> <a @onclick=goRequestUrl class="weui_btn weui_btn_primary">返回</a> </p> </div> <div class=weui_extra_area> <a href="">{{extraMsg}}</a> </div> </div> </div>'},131:function(e,s,o){var r,u;r=o(42),u=o(103),e.exports=r||{},e.exports.__esModule&&(e.exports=e.exports["default"]),u&&(("function"==typeof e.exports?e.exports.options||(e.exports.options={}):e.exports).template=u)}});
//# sourceMappingURL=21.eaa794c5b486f4edc5e1.js.map