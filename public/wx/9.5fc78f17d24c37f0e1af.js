webpackJsonp([9],{45:function(t,e,o){"use strict";function i(t){return t&&t.__esModule?t:{"default":t}}Object.defineProperty(e,"__esModule",{value:!0});var a=o(164),n=i(a),s=o(163),p=i(s);e["default"]={data:function(){return{closeEnter:!0,logined:!1,receive:!1,coupon:{},user:{},mobile:""}},route:{data:function(t){this.$dispatch("show-loading"),this.$http.get("http://jiancan.me/api/u1/coupons/one.json",{coupon_id:this.$route.params.coupon_id}).then(function(t){this.$set("coupon",t.data)},function(t){this.$dispatch("response-msg",t)});var e=localStorage.getItem("jc_user_access_token");null!=e&&(this.$http.get("http://jiancan.me/api/u1/users/current.json",{access_token:e}).then(function(t){this.$set("user",t.data),this.logined=!0},function(t){this.$dispatch("response-msg",t)}),this.$http.get("http://jiancan.me/api/u1/coupon_users/check.json",{access_token:e,coupon_id:this.$route.params.coupon_id}).then(function(t){"SUCCESS"===t.data.resule_code&&(this.receive=!0)},function(t){this.$dispatch("hide-loading"),this.$dispatch("response-msg",t)})),this.$dispatch("hide-loading")}},methods:{close_enter:function(){this.closeEnter=!this.closeEnter},updateMobile:function(){var t=localStorage.getItem("jc_user_access_token");this.$http.post("http://jiancan.me/api/u1/coupons.json",{access_token:t}).then(function(t){this.$dispatch("show-tip",t)},function(t){this.$dispatch("response-msg",t)}),this.user.mobile||null!=t&&this.$http.put("http://jiancan.me/api/u1/users/current.json",{access_token:t,user:{mobile:this.mobile}}).then(function(t){},function(t){this.$dispatch("response-msg",t)})},login:function(){window.location.href="http://jiancan.me/weixin/authorize?request_url="+this.$route.name+"&coupon_id="+this.$route.params.coupon_id}},components:{Flexbox:n["default"],FlexboxItem:p["default"]}}},61:function(t,e,o){e=t.exports=o(3)(),e.push([t.id,".shared_and_addr{position:fixed;right:0;bottom:0;left:0;padding:1rem;background-color:#efefef;opacity:.8;z-index:18888;padding:4px 0}.hd-bg{background:rgba(0,0,0,.7);text-align:center;height:30px;line-height:30px}.hd-bg,.hd-bg a{color:#fff}.coupon_count{color:#000;text-align:center}.jc-input-block{display:block;width:100%;padding:5px;margin-left:-11px;font-size:1rem;line-height:1.5;color:#55595c;background-color:#fff;background-image:none;border:1px solid #ccc}","",{version:3,sources:["/./src/views/coupon.vue"],names:[],mappings:"AAAA,iBAAiB,eAAe,QAAQ,SAAW,OAAO,aAAa,yBAAyB,WAAY,cAAc,aAAa,CAAC,OAAO,0BAA2B,kBAAkB,YAAY,gBAAiB,CAAW,gBAAX,UAAU,CAAqB,cAAc,WAAW,iBAAiB,CAAC,gBAAgB,cAAc,WAAW,YAAY,kBAAkB,eAAe,gBAAgB,cAAc,sBAAsB,sBAAsB,qBAAqB,CAAC",file:"coupon.vue",sourcesContent:[".shared_and_addr{position:fixed;right:0;bottom:0px;left:0;padding:1rem;background-color:#efefef;opacity:0.8;z-index:18888;padding:4px 0}.hd-bg{background:rgba(0,0,0,0.7);text-align:center;height:30px;line-height:30px;color:#FFF}.hd-bg a{color:#FFF}.coupon_count{color:#000;text-align:center}.jc-input-block{display:block;width:100%;padding:5px;margin-left:-11px;font-size:1rem;line-height:1.5;color:#55595c;background-color:#fff;background-image:none;border:1px solid #ccc}\n"],sourceRoot:"webpack://"}])},67:function(t,e,o){var i=o(61);"string"==typeof i&&(i=[[t.id,i,""]]);o(4)(i,{});i.locals&&(t.exports=i.locals)},97:function(t,e){t.exports='<div class=bd> <div class=hd-bg v-show=closeEnter> <a href=http://wx.xj8.net/guide/index> <i class="fa fa-question-circle-o"></i> 查看优惠券领取使用说明 </a> <div style=float:right;margin-right:10px> <i class="fa fa-times-circle-o" @click=close_enter></i> </div> </div> <img class="jc-img-responsive jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/tpl/header/5a3b15bc516c.jpg alt=5a3b15bc516c> <div class=coupon_count> 已有2693人参与此活动, 您还有<span class=count_span>{{ receive ? 0 : 1 }}</span>次领取机会 </div> <flexbox orient=vertical v-if=logined> <flexbox-item v-if=!user.mobile> <div style=padding-top:10px;padding-left:21px;padding-right:11px> <input v-model=mobile type=tel class=jc-input-block maxlength=11 minlength=11 placeholder=请输入手机号马上领取 /> </div> </flexbox-item> <flexbox-item> <a href=javascript:; style=margin:10px class="button button-block button-rounded button-caution"> 立即领取 </a> </flexbox-item> </flexbox> <flexbox v-if=!logined> <flexbox-item> <a @click=login href=javascript:; style=margin:10px class="button button-block button-rounded button-caution"> 授权领取 </a> </flexbox-item> </flexbox> <img class="jc-img-responsive jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/tpl/tel/5a3ddf1da30d.png alt=5a3ddf1da30d> <img class="jc-img-responsive jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/tpl/tip/f9052d2545ee.png alt=F9052d2545ee> <img class="jc-img-responsive jc-margin-bottom-xs" src=xxxHTMLLINKxxx0.62756219087168570.9567121393047273xxx> <div class=am-u-sm-12> <center> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/b35a15d0e746.jpg alt=B35a15d0e746 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/b35a15d0e746.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/4bb17344f607.jpg alt=4bb17344f607 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/4bb17344f607.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/532e00e551c3.jpg alt=532e00e551c3 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/532e00e551c3.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/585b99f01c00.jpg alt=585b99f01c00 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/585b99f01c00.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/5c1ccd11b512.jpg alt=5c1ccd11b512 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/5c1ccd11b512.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/55a7a50892c1.jpg alt=55a7a50892c1 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/55a7a50892c1.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/729ca48dccd5.jpg alt=729ca48dccd5 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/729ca48dccd5.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/9e44874a5063.jpg alt=9e44874a5063 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/9e44874a5063.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/ad60e7bb595d.jpg alt=Ad60e7bb595d data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/ad60e7bb595d.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/a9ab0e5733e0.jpg alt=A9ab0e5733e0 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/a9ab0e5733e0.jpg style=display:block> <img class="jc-img-responsive jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/3ffbe3c7cb93.jpg alt=3ffbe3c7cb93 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/3ffbe3c7cb93.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/730de10f8eff.jpg alt=730de10f8eff data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/730de10f8eff.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/d41b0bed2ca1.jpg alt=D41b0bed2ca1 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/d41b0bed2ca1.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/bace4e0b23e4.jpg alt=Bace4e0b23e4 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/bace4e0b23e4.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/c78a7b0037d4.jpg alt=C78a7b0037d4 data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/c78a7b0037d4.jpg style=display:block> <img class="jc-img-responsive am-img-thumbnail am-radius jc-margin-bottom-xs" src=http://upyun.wx.xj8.net//uploads/promotion_image/image/affd799b412c.jpg alt=Affd799b412c data-original=http://upyun.wx.xj8.net//uploads/promotion_image/image/affd799b412c.jpg style=display:block> </center> </div> <div style=text-align:center;color:#000> 本页面由简餐网提供<br> 技术支持:动起来软件有限公司 业务咨询: 15768092082 </div> </div> <div style=height:60px;width:100%></div> <flexbox class=shared_and_addr> <flexbox-item style=padding-left:5px> <a href=tel:13399087064 class="button button-block button-rounded button-highlight"> <i class="fa fa-phone"></i> 咨询电话 </a> </flexbox-item> <flexbox-item style=padding-right:5px> <a href=javascript:; class="button button-block button-rounded button-highlight"> <i class="fa fa-map-marker"></i> 店铺地址 </a> </flexbox-item> </flexbox>'},123:function(t,e,o){var i,a;o(67),i=o(45),a=o(97),t.exports=i||{},t.exports.__esModule&&(t.exports=t.exports["default"]),a&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=a)},163:function(t,e,o){!function(e,o){t.exports=o()}(this,function(){return function(t){function e(i){if(o[i])return o[i].exports;var a=o[i]={exports:{},id:i,loaded:!1};return t[i].call(a.exports,a,a.exports,e),a.loaded=!0,a.exports}var o={};return e.m=t,e.c=o,e.p="",e(0)}([function(t,e,o){t.exports=o(3)},function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var o=["-moz-box-","-webkit-box-",""];e["default"]={props:{span:{type:Number}},computed:{style:function(){var t={},e="horizontal"===this.$parent.orient?"marginLeft":"marginTop";if(t[e]=this.$parent.supported?this.$parent.gutter+"px":0,this.span)for(var i=0;i<o.length;i++)t[o[i]+"flex"]="0 0 "+100*(this.span>=1?this.span/12:this.span)+"%";return t}}}},function(t,e){t.exports="<div class=vux-flexbox-item :style=style> <slot></slot> </div>"},function(t,e,o){var i,a;i=o(1),a=o(2),t.exports=i||{},t.exports.__esModule&&(t.exports=t.exports["default"]),a&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=a)}])})},164:function(t,e,o){!function(e,o){t.exports=o()}(this,function(){return function(t){function e(i){if(o[i])return o[i].exports;var a=o[i]={exports:{},id:i,loaded:!1};return t[i].call(a.exports,a,a.exports,e),a.loaded=!0,a.exports}var o={};return e.m=t,e.c=o,e.p="",e(0)}([function(t,e,o){t.exports=o(5)},function(t,e,o){"use strict";function i(t){return t&&t.__esModule?t:{"default":t}}Object.defineProperty(e,"__esModule",{value:!0});var a=o(2),n=i(a);e["default"]={created:function(){this.supported=n["default"].flex},ready:function(){if(!this.supported){var t=this.$el.querySelectorAll(".vux-flexbox-item");this.$el.classList.remove("vux-flexbox"),this.$el.classList.add("vux-flexbox-unsupport");for(var e=t.length,o=100/e+"%",i=0;e>i;i++)t[i].style.width=o,t[i].style["box-sizing"]="border-box",t[i].style["margin-left"]=0,t[i].style["float"]="left"}},props:{gutter:{type:Number,"default":8},orient:{type:String,"default":"horizontal"}}}},function(t,e){"use strict";function o(t,e){var o=document.createElement("div");o.style.cssText=i(t),s[e]=!!o.style.length,a.className+=" "+(s[e]?"":"no-")+e}function i(t){for(var e="",o=0;o<n.length;o++)e+=n[o]+t;return e}Object.defineProperty(e,"__esModule",{value:!0});var a=document.documentElement,n=["-webkit-","-moz-","-ms-","-o-",""],s={};o("flex-basis: 1px;","flexbox"),o("box-direction: reverse;","flexboxlegacy"),o("flex-align: end;","flexboxtweener"),o("flex-wrap: wrap;","flexwrap"),s.flex=s.flexbox,s.legacy=s.flexboxlegacy,s.tweener=s.flexboxtweener,s.wrap=s.flexwrap,e["default"]=s},function(t,e){},function(t,e){t.exports="<div class=vux-flexbox :class=\"{'flex-col': orient == 'vertical', 'flex-row': orient == 'horizontal'}\"> <slot></slot> </div>"},function(t,e,o){var i,a;o(3),i=o(1),a=o(4),t.exports=i||{},t.exports.__esModule&&(t.exports=t.exports["default"]),a&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=a)}])})}});
//# sourceMappingURL=9.5fc78f17d24c37f0e1af.js.map