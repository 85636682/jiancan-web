webpackJsonp([9],{1:function(t,e,o){!function(e,o){t.exports=o()}(this,function(){return function(t){function e(i){if(o[i])return o[i].exports;var a=o[i]={exports:{},id:i,loaded:!1};return t[i].call(a.exports,a,a.exports,e),a.loaded=!0,a.exports}var o={};return e.m=t,e.c=o,e.p="",e(0)}([function(t,e,o){t.exports=o(4)},function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={props:{leftOptions:{type:Object,"default":function(){return{showBack:!0,backText:"Back",preventGoBack:!1}}},rightOptions:{type:Object,"default":function(){return{showMore:!1}}}},methods:{onClickBack:function(){this.leftOptions.preventGoBack?this.$dispatch("on-click-back"):history.back()}}}},function(t,e){},function(t,e){t.exports="<div class=x-header> <div class=x-header-left> <a class=x-header-back @click.preventdefault v-show=leftOptions.showBack @click=onClickBack>{{leftOptions.backText}}</a> <slot name=left></slot> </div> <h1 class=x-header-title><slot></slot></h1> <div class=x-header-right> <a class=x-header-more @click.preventdefault @click=\"$dispatch('on-click-more')\" v-if=rightOptions.showMore></a> <slot name=right></slot> </div> </div>"},function(t,e,o){var i,a;o(2),i=o(1),a=o(3),t.exports=i||{},t.exports.__esModule&&(t.exports=t.exports["default"]),a&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=a)}])})},45:function(t,e,o){"use strict";function i(t){return t&&t.__esModule?t:{"default":t}}Object.defineProperty(e,"__esModule",{value:!0});var a=o(1),s=i(a),n=o(164),p=i(n),c=o(163),r=i(c);e["default"]={data:function(){return{closeEnter:!0,logined:!1,receive:!1,coupon:{shop:{}},user:{},mobile:""}},route:{data:function(t){this.$dispatch("show-loading"),this.$http.get("http://jiancan.me/api/u1/coupons/one.json",{coupon_id:this.$route.params.coupon_id}).then(function(t){this.$set("coupon",t.data)},function(t){this.$dispatch("response-msg",t)});var e=localStorage.getItem("jc_user_access_token");null!=e&&(this.$http.get("http://jiancan.me/api/u1/users/current.json",{access_token:e}).then(function(t){this.$set("user",t.data),this.logined=!0},function(t){this.$dispatch("response-msg",t)}),this.$http.get("http://jiancan.me/api/u1/coupon_users/check.json",{access_token:e,coupon_id:this.$route.params.coupon_id}).then(function(t){"SUCCESS"===t.data.result_code&&(this.receive=!0)},function(t){this.$dispatch("hide-loading"),this.$dispatch("response-msg",t)})),this.$dispatch("hide-loading")}},methods:{close_enter:function(){this.closeEnter=!this.closeEnter},receiveCoupon:function(){this.$dispatch("show-loading");var t=localStorage.getItem("jc_user_access_token");null!=t&&(this.$http.post("http://jiancan.me/api/u1/coupon_users.json",{access_token:t,coupon_id:this.$route.params.coupon_id}).then(function(t){this.receive=!0,this.$dispatch("show-tip")},function(t){this.$dispatch("response-msg",t)}),this.user.mobile||this.$http.put("http://jiancan.me/api/u1/users/current.json",{access_token:t,mobile:this.mobile}).then(function(t){this.$set("user",t.data)},function(t){this.$dispatch("response-msg",t)})),this.$dispatch("hide-loading")},login:function(){window.location.href="http://jiancan.me/weixin/authorize?request_url="+this.$route.name+"&coupon_id="+this.$route.params.coupon_id}},components:{XHeader:s["default"],Flexbox:p["default"],FlexboxItem:r["default"]}}},61:function(t,e,o){e=t.exports=o(3)(),e.push([t.id,".shared_and_addr{position:fixed;right:0;bottom:0;left:0;padding:1rem;background-color:#efefef;opacity:.8;z-index:18888;padding:4px 0}.hd-bg{background:rgba(0,0,0,.7);text-align:center;height:30px;line-height:30px}.hd-bg,.hd-bg a{color:#fff}.coupon_count{color:#000;text-align:center}.jc-input-block{display:block;width:100%;padding:5px;margin-left:-11px;font-size:1rem;line-height:1.5;color:#55595c;background-color:#fff;background-image:none;border:1px solid #ccc}.coupon-products-table{overflow:hidden;width:100%}.coupon-products-table td{overflow:hidden}.coupon-products-table .avatars{width:40px}.coupon-products-table .names{text-align:left}.coupon-products-table .prices{width:80px}.coupon-products-table .amounts{width:60px}","",{version:3,sources:["/./src/views/coupon.vue"],names:[],mappings:"AAAA,iBAAiB,eAAe,QAAQ,SAAW,OAAO,aAAa,yBAAyB,WAAY,cAAc,aAAa,CAAC,OAAO,0BAA2B,kBAAkB,YAAY,gBAAiB,CAAW,gBAAX,UAAU,CAAqB,cAAc,WAAW,iBAAiB,CAAC,gBAAgB,cAAc,WAAW,YAAY,kBAAkB,eAAe,gBAAgB,cAAc,sBAAsB,sBAAsB,qBAAqB,CAAC,uBAAuB,gBAAgB,UAAU,CAAC,0BAA0B,eAAe,CAAC,gCAAgC,UAAU,CAAC,8BAA8B,eAAe,CAAC,+BAA+B,UAAU,CAAC,gCAAgC,UAAU,CAAC",file:"coupon.vue",sourcesContent:[".shared_and_addr{position:fixed;right:0;bottom:0px;left:0;padding:1rem;background-color:#efefef;opacity:0.8;z-index:18888;padding:4px 0}.hd-bg{background:rgba(0,0,0,0.7);text-align:center;height:30px;line-height:30px;color:#FFF}.hd-bg a{color:#FFF}.coupon_count{color:#000;text-align:center}.jc-input-block{display:block;width:100%;padding:5px;margin-left:-11px;font-size:1rem;line-height:1.5;color:#55595c;background-color:#fff;background-image:none;border:1px solid #ccc}.coupon-products-table{overflow:hidden;width:100%}.coupon-products-table td{overflow:hidden}.coupon-products-table .avatars{width:40px}.coupon-products-table .names{text-align:left}.coupon-products-table .prices{width:80px}.coupon-products-table .amounts{width:60px}\n"],sourceRoot:"webpack://"}])},67:function(t,e,o){var i=o(61);"string"==typeof i&&(i=[[t.id,i,""]]);o(4)(i,{});i.locals&&(t.exports=i.locals)},97:function(t,e){t.exports='<x-header>{{coupon.title}}</x-header> <div class=bd> <div class=hd-bg v-show=closeEnter> <a href=http://wx.xj8.net/guide/index> <i class="fa fa-question-circle-o"></i> 查看优惠券领取使用说明 </a> <div style=float:right;margin-right:10px> <i class="fa fa-times-circle-o" @click=close_enter></i> </div> </div> <img class="jc-img-responsive jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/tpl/header/5a3b15bc516c.jpg alt=5a3b15bc516c> <div class=coupon_count> 已有 {{coupon.coupon_users_count}} 人参与此活动, 您还有 <span class=count_span>{{ receive ? 0 : 1 }}</span> 次领取机会 </div> <flexbox orient=vertical v-if=logined> <flexbox-item v-if=!user.mobile> <div style=padding-top:10px;padding-left:21px;padding-right:11px> <input v-model=mobile type=tel class=jc-input-block maxlength=11 minlength=11 placeholder=请输入手机号马上领取 /> </div> </flexbox-item> <flexbox-item> <a @click=receiveCoupon :class="{ \'disabled\': receive }" class="button button-block button-rounded button-caution" href=javascript:; style=margin:10px> {{ receive ? \'你已领取\' : \'立即领取\' }} </a> </flexbox-item> </flexbox> <flexbox v-if=!logined> <flexbox-item v-if=!receive> <a @click=login class="button button-block button-rounded button-caution" href=javascript:; style=margin:10px> 授权领取 </a> </flexbox-item> </flexbox> <flexbox orient=vertical> <flexbox-item style=text-align:center> <p>地址：{{coupon.shop.address}}</p> </flexbox-item> <flexbox-item style=text-align:center> <p> 电话：{{coupon.shop.mobile}} </p> </flexbox-item> <flexbox-item style=text-align:center> <span>套餐内容</span> <table class=coupon-products-table> <tr> <td colspan=4> 参与优惠劵的商品 </td> </tr> <tr v-for="coupon_product in coupon.coupon_products"> <td class=avatars><img alt=店铺头像 class=img-circle width=30 height=30 v-bind:src=coupon_product.product.avatar /></td> <td class=names>{{coupon_product.product.name}}</td> <td class=prices>￥ {{coupon_product.product.price}}</td> <td class=amounts>{{coupon_product.amount}} 份</td> </tr> </table> </flexbox-item> </flexbox> <img class="jc-img-responsive jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/tpl/tel/5a3ddf1da30d.png alt=5a3ddf1da30d> <img class="jc-img-responsive jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/tpl/tip/f9052d2545ee.png alt=F9052d2545ee> <img class="jc-img-responsive jc-margin-bottom-xs" src=xxxHTMLLINKxxx0.78551659150980410.8454100009985268xxx> <div class=am-u-sm-12> <center> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/b35a15d0e746.jpg alt=B35a15d0e746 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/b35a15d0e746.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/4bb17344f607.jpg alt=4bb17344f607 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/4bb17344f607.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/532e00e551c3.jpg alt=532e00e551c3 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/532e00e551c3.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/585b99f01c00.jpg alt=585b99f01c00 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/585b99f01c00.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/5c1ccd11b512.jpg alt=5c1ccd11b512 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/5c1ccd11b512.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/55a7a50892c1.jpg alt=55a7a50892c1 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/55a7a50892c1.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/729ca48dccd5.jpg alt=729ca48dccd5 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/729ca48dccd5.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/9e44874a5063.jpg alt=9e44874a5063 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/9e44874a5063.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/ad60e7bb595d.jpg alt=Ad60e7bb595d data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/ad60e7bb595d.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/a9ab0e5733e0.jpg alt=A9ab0e5733e0 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/a9ab0e5733e0.jpg style=display:block> <img class="jc-img-responsive jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/3ffbe3c7cb93.jpg alt=3ffbe3c7cb93 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/3ffbe3c7cb93.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/730de10f8eff.jpg alt=730de10f8eff data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/730de10f8eff.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/d41b0bed2ca1.jpg alt=D41b0bed2ca1 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/d41b0bed2ca1.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/bace4e0b23e4.jpg alt=Bace4e0b23e4 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/bace4e0b23e4.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/c78a7b0037d4.jpg alt=C78a7b0037d4 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/c78a7b0037d4.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/affd799b412c.jpg alt=Affd799b412c data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/affd799b412c.jpg style=display:block> </center> </div> <div style=text-align:center;color:#000> 本页面由简餐网提供<br> 技术支持:动起来软件有限公司 业务咨询: 15768092082 </div> </div> <div style=height:60px;width:100%></div> <flexbox class=shared_and_addr> <flexbox-item style=padding-left:5px> <a href="tel:{{ coupon.shop.mobile }}" class="button button-block button-rounded button-highlight"> <i class="fa fa-phone"></i> 咨询电话 </a> </flexbox-item> <flexbox-item style=padding-right:5px> <a href=javascript:; class="button button-block button-rounded button-highlight"> <i class="fa fa-map-marker"></i> 店铺地址 </a> </flexbox-item> </flexbox>'},123:function(t,e,o){var i,a;o(67),i=o(45),a=o(97),t.exports=i||{},t.exports.__esModule&&(t.exports=t.exports["default"]),a&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=a)},163:function(t,e,o){!function(e,o){t.exports=o()}(this,function(){return function(t){function e(i){if(o[i])return o[i].exports;var a=o[i]={exports:{},id:i,loaded:!1};return t[i].call(a.exports,a,a.exports,e),a.loaded=!0,a.exports}var o={};return e.m=t,e.c=o,e.p="",e(0)}([function(t,e,o){t.exports=o(3)},function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var o=["-moz-box-","-webkit-box-",""];e["default"]={props:{span:{type:Number}},computed:{style:function(){var t={},e="horizontal"===this.$parent.orient?"marginLeft":"marginTop";if(t[e]=this.$parent.supported?this.$parent.gutter+"px":0,this.span)for(var i=0;i<o.length;i++)t[o[i]+"flex"]="0 0 "+100*(this.span>=1?this.span/12:this.span)+"%";return t}}}},function(t,e){t.exports="<div class=vux-flexbox-item :style=style> <slot></slot> </div>"},function(t,e,o){var i,a;i=o(1),a=o(2),t.exports=i||{},t.exports.__esModule&&(t.exports=t.exports["default"]),a&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=a)}])})},164:function(t,e,o){!function(e,o){t.exports=o()}(this,function(){return function(t){function e(i){if(o[i])return o[i].exports;var a=o[i]={exports:{},id:i,loaded:!1};return t[i].call(a.exports,a,a.exports,e),a.loaded=!0,a.exports}var o={};return e.m=t,e.c=o,e.p="",e(0)}([function(t,e,o){t.exports=o(5)},function(t,e,o){"use strict";function i(t){return t&&t.__esModule?t:{"default":t}}Object.defineProperty(e,"__esModule",{value:!0});var a=o(2),s=i(a);e["default"]={created:function(){this.supported=s["default"].flex},ready:function(){if(!this.supported){var t=this.$el.querySelectorAll(".vux-flexbox-item");this.$el.classList.remove("vux-flexbox"),this.$el.classList.add("vux-flexbox-unsupport");for(var e=t.length,o=100/e+"%",i=0;e>i;i++)t[i].style.width=o,t[i].style["box-sizing"]="border-box",t[i].style["margin-left"]=0,t[i].style["float"]="left"}},props:{gutter:{type:Number,"default":8},orient:{type:String,"default":"horizontal"}}}},function(t,e){"use strict";function o(t,e){var o=document.createElement("div");o.style.cssText=i(t),n[e]=!!o.style.length,a.className+=" "+(n[e]?"":"no-")+e}function i(t){for(var e="",o=0;o<s.length;o++)e+=s[o]+t;return e}Object.defineProperty(e,"__esModule",{value:!0});var a=document.documentElement,s=["-webkit-","-moz-","-ms-","-o-",""],n={};o("flex-basis: 1px;","flexbox"),o("box-direction: reverse;","flexboxlegacy"),o("flex-align: end;","flexboxtweener"),o("flex-wrap: wrap;","flexwrap"),n.flex=n.flexbox,n.legacy=n.flexboxlegacy,n.tweener=n.flexboxtweener,n.wrap=n.flexwrap,e["default"]=n},function(t,e){},function(t,e){t.exports="<div class=vux-flexbox :class=\"{'flex-col': orient == 'vertical', 'flex-row': orient == 'horizontal'}\"> <slot></slot> </div>"},function(t,e,o){var i,a;o(3),i=o(1),a=o(4),t.exports=i||{},t.exports.__esModule&&(t.exports=t.exports["default"]),a&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=a)}])})}});
//# sourceMappingURL=9.c2a0382e5fa13c7c163d.js.map