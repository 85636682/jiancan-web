webpackJsonp([9],{1:function(t,e,o){!function(e,o){t.exports=o()}(this,function(){return function(t){function e(n){if(o[n])return o[n].exports;var i=o[n]={exports:{},id:n,loaded:!1};return t[n].call(i.exports,i,i.exports,e),i.loaded=!0,i.exports}var o={};return e.m=t,e.c=o,e.p="",e(0)}([function(t,e,o){t.exports=o(4)},function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={props:{leftOptions:{type:Object,"default":function(){return{showBack:!0,backText:"Back",preventGoBack:!1}}},rightOptions:{type:Object,"default":function(){return{showMore:!1}}}},methods:{onClickBack:function(){this.leftOptions.preventGoBack?this.$dispatch("on-click-back"):history.back()}}}},function(t,e){},function(t,e){t.exports="<div class=x-header> <div class=x-header-left> <a class=x-header-back @click.preventdefault v-show=leftOptions.showBack @click=onClickBack>{{leftOptions.backText}}</a> <slot name=left></slot> </div> <h1 class=x-header-title><slot></slot></h1> <div class=x-header-right> <a class=x-header-more @click.preventdefault @click=\"$dispatch('on-click-more')\" v-if=rightOptions.showMore></a> <slot name=right></slot> </div> </div>"},function(t,e,o){var n,i;o(2),n=o(1),i=o(3),t.exports=n||{},t.exports.__esModule&&(t.exports=t.exports["default"]),i&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=i)}])})},45:function(t,e,o){"use strict";function n(t){return t&&t.__esModule?t:{"default":t}}Object.defineProperty(e,"__esModule",{value:!0});var i=o(1),s=n(i),c=o(164),r=n(c),a=o(163),l=n(a);e["default"]={data:function(){return{leftOptions:{showBack:!0,backText:"Back",preventGoBack:!0},closeEnter:!0,logined:!1,receive:!1,coupon:{shop:{}},user:{},mobile:""}},route:{data:function(t){this.$dispatch("show-loading"),this.$http.get("http://jiancan.me/api/u1/coupons/one.json",{coupon_id:this.$route.params.coupon_id}).then(function(t){this.$set("coupon",t.data)},function(t){this.$dispatch("response-msg",t)});var e=localStorage.getItem("jc_user_access_token");null!=e&&(this.$http.get("http://jiancan.me/api/u1/users/current.json",{access_token:e}).then(function(t){this.$set("user",t.data),this.logined=!0},function(t){this.$dispatch("response-msg",t)}),this.$http.get("http://jiancan.me/api/u1/coupon_users/check.json",{access_token:e,coupon_id:this.$route.params.coupon_id}).then(function(t){"SUCCESS"===t.data.result_code&&(this.receive=!0)},function(t){this.$dispatch("hide-loading"),this.$dispatch("response-msg",t)})),this.$dispatch("hide-loading")}},methods:{close_enter:function(){this.closeEnter=!this.closeEnter},receiveCoupon:function(){this.$dispatch("show-loading");var t=localStorage.getItem("jc_user_access_token");null!=t&&(this.$http.post("http://jiancan.me/api/u1/coupon_users.json",{access_token:t,coupon_id:this.$route.params.coupon_id}).then(function(t){this.receive=!0,this.$dispatch("show-tip")},function(t){this.$dispatch("response-msg",t)}),this.user.mobile||this.$http.put("http://jiancan.me/api/u1/users/current.json",{access_token:t,mobile:this.mobile}).then(function(t){this.$set("user",t.data)},function(t){this.$dispatch("response-msg",t)})),this.$dispatch("hide-loading")},login:function(){window.location.href="http://jiancan.me/weixin/authorize?request_url="+this.$route.name+"&coupon_id="+this.$route.params.coupon_id}},events:{"on-click-back":function(){this.$route.router.go({name:"coupons"})}},components:{XHeader:s["default"],Flexbox:r["default"],FlexboxItem:l["default"]}}},61:function(t,e,o){e=t.exports=o(3)(),e.push([t.id,".shared_and_addr{position:fixed;right:0;bottom:0;left:0;padding:1rem;background-color:#efefef;opacity:.8;z-index:18888;padding:4px 0}.hd-bg{background:rgba(0,0,0,.7);text-align:center;height:30px;line-height:30px}.hd-bg,.hd-bg a{color:#fff}.coupon_count{color:#000;text-align:center}.jc-input-block{display:block;width:100%;padding:5px;margin-left:-11px;font-size:1rem;line-height:1.5;color:#55595c;background-color:#fff;background-image:none;border:1px solid #ccc}.coupon-products-table{overflow:hidden;width:100%}.coupon-products-table td{overflow:hidden}.coupon-products-table .avatars{width:40px}.coupon-products-table .names{text-align:left}.coupon-products-table .prices{width:80px}.coupon-products-table .amounts{width:60px}","",{version:3,sources:["/./src/views/coupon.vue"],names:[],mappings:"AAAA,iBAAiB,eAAe,QAAQ,SAAW,OAAO,aAAa,yBAAyB,WAAY,cAAc,aAAa,CAAC,OAAO,0BAA2B,kBAAkB,YAAY,gBAAiB,CAAW,gBAAX,UAAU,CAAqB,cAAc,WAAW,iBAAiB,CAAC,gBAAgB,cAAc,WAAW,YAAY,kBAAkB,eAAe,gBAAgB,cAAc,sBAAsB,sBAAsB,qBAAqB,CAAC,uBAAuB,gBAAgB,UAAU,CAAC,0BAA0B,eAAe,CAAC,gCAAgC,UAAU,CAAC,8BAA8B,eAAe,CAAC,+BAA+B,UAAU,CAAC,gCAAgC,UAAU,CAAC",file:"coupon.vue",sourcesContent:[".shared_and_addr{position:fixed;right:0;bottom:0px;left:0;padding:1rem;background-color:#efefef;opacity:0.8;z-index:18888;padding:4px 0}.hd-bg{background:rgba(0,0,0,0.7);text-align:center;height:30px;line-height:30px;color:#FFF}.hd-bg a{color:#FFF}.coupon_count{color:#000;text-align:center}.jc-input-block{display:block;width:100%;padding:5px;margin-left:-11px;font-size:1rem;line-height:1.5;color:#55595c;background-color:#fff;background-image:none;border:1px solid #ccc}.coupon-products-table{overflow:hidden;width:100%}.coupon-products-table td{overflow:hidden}.coupon-products-table .avatars{width:40px}.coupon-products-table .names{text-align:left}.coupon-products-table .prices{width:80px}.coupon-products-table .amounts{width:60px}\n"],sourceRoot:"webpack://"}])},67:function(t,e,o){var n=o(61);"string"==typeof n&&(n=[[t.id,n,""]]);o(4)(n,{});n.locals&&(t.exports=n.locals)},97:function(t,e){t.exports='<x-header :left-options=leftOptions>{{coupon.title}}</x-header> <div class=bd> <div class=hd-bg v-show=closeEnter> <a href=http://wx.xj8.net/guide/index> <i class="fa fa-question-circle-o"></i> 查看优惠券领取使用说明 </a> <div style=float:right;margin-right:10px> <i class="fa fa-times-circle-o" @click=close_enter></i> </div> </div> <img class="jc-img-responsive jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/tpl/header/5a3b15bc516c.jpg alt=5a3b15bc516c> <div class=coupon_count> 已有 {{coupon.coupon_users_count}} 人参与此活动, 您还有 <span class=count_span>{{ receive ? 0 : 1 }}</span> 次领取机会 </div> <flexbox orient=vertical v-if=logined> <flexbox-item v-if=!user.mobile> <div style=padding-top:10px;padding-left:21px;padding-right:11px> <input v-model=mobile type=tel class=jc-input-block maxlength=11 minlength=11 placeholder=请输入手机号马上领取 /> </div> </flexbox-item> <flexbox-item> <a @click=receiveCoupon :class="{ \'disabled\': receive }" class="button button-block button-rounded button-caution" href=javascript:; style=margin:10px> {{ receive ? \'你已领取\' : \'立即领取\' }} </a> </flexbox-item> </flexbox> <flexbox v-if=!logined> <flexbox-item v-if=!receive> <a @click=login class="button button-block button-rounded button-caution" href=javascript:; style=margin:10px> 授权领取 </a> </flexbox-item> </flexbox> <flexbox orient=vertical> <flexbox-item style=text-align:center> <p>地址：{{coupon.shop.address}}</p> </flexbox-item> <flexbox-item style=text-align:center> <p> 电话：{{coupon.shop.mobile}} </p> </flexbox-item> <flexbox-item style=text-align:center> <span>套餐内容</span> <table class=coupon-products-table> <tr> <td colspan=4> 参与优惠劵的商品 </td> </tr> <tr v-for="coupon_product in coupon.coupon_products"> <td class=avatars><img alt=店铺头像 class=img-circle width=30 height=30 v-bind:src=coupon_product.product.avatar /></td> <td class=names>{{coupon_product.product.name}}</td> <td class=prices>￥ {{coupon_product.product.price}}</td> <td class=amounts>{{coupon_product.amount}} 份</td> </tr> </table> </flexbox-item> </flexbox> <div class=am-u-sm-12> <center> <img v-for="image in coupon.images" :src=image.img520xAuto class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" style=display:block> </center> </div> <div style=text-align:center;color:#000> 本页面由简餐网提供<br> 技术支持:动起来软件有限公司 业务咨询: 15768092082 </div> </div> <div style=height:60px;width:100%></div> <flexbox class=shared_and_addr> <flexbox-item style=padding-left:5px> <a href="tel:{{ coupon.shop.mobile }}" class="button button-block button-rounded button-highlight"> <i class="fa fa-phone"></i> 咨询电话 </a> </flexbox-item> <flexbox-item style=padding-right:5px> <a href=javascript:; class="button button-block button-rounded button-highlight"> <i class="fa fa-map-marker"></i> 店铺地址 </a> </flexbox-item> </flexbox>'},123:function(t,e,o){var n,i;o(67),n=o(45),i=o(97),t.exports=n||{},t.exports.__esModule&&(t.exports=t.exports["default"]),i&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=i)},163:function(t,e,o){!function(e,o){t.exports=o()}(this,function(){return function(t){function e(n){if(o[n])return o[n].exports;var i=o[n]={exports:{},id:n,loaded:!1};return t[n].call(i.exports,i,i.exports,e),i.loaded=!0,i.exports}var o={};return e.m=t,e.c=o,e.p="",e(0)}([function(t,e,o){t.exports=o(3)},function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var o=["-moz-box-","-webkit-box-",""];e["default"]={props:{span:{type:Number}},computed:{style:function(){var t={},e="horizontal"===this.$parent.orient?"marginLeft":"marginTop";if(t[e]=this.$parent.supported?this.$parent.gutter+"px":0,this.span)for(var n=0;n<o.length;n++)t[o[n]+"flex"]="0 0 "+100*(this.span>=1?this.span/12:this.span)+"%";return t}}}},function(t,e){t.exports="<div class=vux-flexbox-item :style=style> <slot></slot> </div>"},function(t,e,o){var n,i;n=o(1),i=o(2),t.exports=n||{},t.exports.__esModule&&(t.exports=t.exports["default"]),i&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=i)}])})},164:function(t,e,o){!function(e,o){t.exports=o()}(this,function(){return function(t){function e(n){if(o[n])return o[n].exports;var i=o[n]={exports:{},id:n,loaded:!1};return t[n].call(i.exports,i,i.exports,e),i.loaded=!0,i.exports}var o={};return e.m=t,e.c=o,e.p="",e(0)}([function(t,e,o){t.exports=o(5)},function(t,e,o){"use strict";function n(t){return t&&t.__esModule?t:{"default":t}}Object.defineProperty(e,"__esModule",{value:!0});var i=o(2),s=n(i);e["default"]={created:function(){this.supported=s["default"].flex},ready:function(){if(!this.supported){var t=this.$el.querySelectorAll(".vux-flexbox-item");this.$el.classList.remove("vux-flexbox"),this.$el.classList.add("vux-flexbox-unsupport");for(var e=t.length,o=100/e+"%",n=0;e>n;n++)t[n].style.width=o,t[n].style["box-sizing"]="border-box",t[n].style["margin-left"]=0,t[n].style["float"]="left"}},props:{gutter:{type:Number,"default":8},orient:{type:String,"default":"horizontal"}}}},function(t,e){"use strict";function o(t,e){var o=document.createElement("div");o.style.cssText=n(t),c[e]=!!o.style.length,i.className+=" "+(c[e]?"":"no-")+e}function n(t){for(var e="",o=0;o<s.length;o++)e+=s[o]+t;return e}Object.defineProperty(e,"__esModule",{value:!0});var i=document.documentElement,s=["-webkit-","-moz-","-ms-","-o-",""],c={};o("flex-basis: 1px;","flexbox"),o("box-direction: reverse;","flexboxlegacy"),o("flex-align: end;","flexboxtweener"),o("flex-wrap: wrap;","flexwrap"),c.flex=c.flexbox,c.legacy=c.flexboxlegacy,c.tweener=c.flexboxtweener,c.wrap=c.flexwrap,e["default"]=c},function(t,e){},function(t,e){t.exports="<div class=vux-flexbox :class=\"{'flex-col': orient == 'vertical', 'flex-row': orient == 'horizontal'}\"> <slot></slot> </div>"},function(t,e,o){var n,i;o(3),n=o(1),i=o(4),t.exports=n||{},t.exports.__esModule&&(t.exports=t.exports["default"]),i&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=i)}])})}});
//# sourceMappingURL=9.6b288e2522c18dddb7bd.js.map