webpackJsonp([6],{1:function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={props:["goBack"],methods:{GoBack:function(){this.$route.router.go({path:this.goBack})}}}},2:function(t,e){t.exports='<div class=navigation_bar> <div class=middle> <slot name=middle_content> </slot> </div> <div class=left> <a class=go_back @click=GoBack> <i class="fa fa-arrow-left"></i> </a> </div> <div class=right> <slot name=right_items> </slot> </div> </div>'},3:function(t,e,s){var i,o;i=s(1),o=s(2),t.exports=i||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)},4:function(t,e){t.exports=function(){var t=[];return t.toString=function(){for(var t=[],e=0;e<this.length;e++){var s=this[e];s[2]?t.push("@media "+s[2]+"{"+s[1]+"}"):t.push(s[1])}return t.join("")},t.i=function(e,s){"string"==typeof e&&(e=[[null,e,""]]);for(var i={},o=0;o<this.length;o++){var n=this[o][0];"number"==typeof n&&(i[n]=!0)}for(o=0;o<e.length;o++){var a=e[o];"number"==typeof a[0]&&i[a[0]]||(s&&!a[2]?a[2]=s:s&&(a[2]="("+a[2]+") and ("+s+")"),t.push(a))}},t}},5:function(t,e,s){function i(t,e){for(var s=0;s<t.length;s++){var i=t[s],o=d[i.id];if(o){o.refs++;for(var n=0;n<o.parts.length;n++)o.parts[n](i.parts[n]);for(;n<i.parts.length;n++)o.parts.push(c(i.parts[n],e))}else{for(var a=[],n=0;n<i.parts.length;n++)a.push(c(i.parts[n],e));d[i.id]={id:i.id,refs:1,parts:a}}}}function o(t){for(var e=[],s={},i=0;i<t.length;i++){var o=t[i],n=o[0],a=o[1],r=o[2],c=o[3],l={css:a,media:r,sourceMap:c};s[n]?s[n].parts.push(l):e.push(s[n]={id:n,parts:[l]})}return e}function n(t,e){var s=h(),i=b[b.length-1];if("top"===t.insertAt)i?i.nextSibling?s.insertBefore(e,i.nextSibling):s.appendChild(e):s.insertBefore(e,s.firstChild),b.push(e);else{if("bottom"!==t.insertAt)throw new Error("Invalid value for parameter 'insertAt'. Must be 'top' or 'bottom'.");s.appendChild(e)}}function a(t){t.parentNode.removeChild(t);var e=b.indexOf(t);e>=0&&b.splice(e,1)}function r(t){var e=document.createElement("style");return e.type="text/css",n(t,e),e}function c(t,e){var s,i,o;if(e.singleton){var n=g++;s=v||(v=r(e)),i=l.bind(null,s,n,!1),o=l.bind(null,s,n,!0)}else s=r(e),i=u.bind(null,s),o=function(){a(s)};return i(t),function(e){if(e){if(e.css===t.css&&e.media===t.media&&e.sourceMap===t.sourceMap)return;i(t=e)}else o()}}function l(t,e,s,i){var o=s?"":i.css;if(t.styleSheet)t.styleSheet.cssText=_(e,o);else{var n=document.createTextNode(o),a=t.childNodes;a[e]&&t.removeChild(a[e]),a.length?t.insertBefore(n,a[e]):t.appendChild(n)}}function u(t,e){var s=e.css,i=e.media,o=e.sourceMap;if(i&&t.setAttribute("media",i),o&&(s+="\n/*# sourceURL="+o.sources[0]+" */",s+="\n/*# sourceMappingURL=data:application/json;base64,"+btoa(unescape(encodeURIComponent(JSON.stringify(o))))+" */"),t.styleSheet)t.styleSheet.cssText=s;else{for(;t.firstChild;)t.removeChild(t.firstChild);t.appendChild(document.createTextNode(s))}}var d={},p=function(t){var e;return function(){return"undefined"==typeof e&&(e=t.apply(this,arguments)),e}},f=p(function(){return/msie [6-9]\b/.test(window.navigator.userAgent.toLowerCase())}),h=p(function(){return document.head||document.getElementsByTagName("head")[0]}),v=null,g=0,b=[];t.exports=function(t,e){e=e||{},"undefined"==typeof e.singleton&&(e.singleton=f()),"undefined"==typeof e.insertAt&&(e.insertAt="bottom");var s=o(t);return i(s,e),function(t){for(var n=[],a=0;a<s.length;a++){var r=s[a],c=d[r.id];c.refs--,n.push(c)}if(t){var l=o(t);i(l,e)}for(var a=0;a<n.length;a++){var c=n[a];if(0===c.refs){for(var u=0;u<c.parts.length;u++)c.parts[u]();delete d[c.id]}}}};var _=function(){var t=[];return function(e,s){return t[e]=s,t.filter(Boolean).join("\n")}}()},7:function(t,e,s){!function(e,s){t.exports=s()}(this,function(){return function(t){function e(i){if(s[i])return s[i].exports;var o=s[i]={exports:{},id:i,loaded:!1};return t[i].call(o.exports,o,o.exports,e),o.loaded=!0,o.exports}var s={};return e.m=t,e.c=s,e.p="",e(0)}([function(t,e,s){t.exports=s(4)},function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={ready:function(){for(var t=0;t<this.max;t++)this.colors.push("#ccc");this.value&&this.handleClick(this.value-1,!0)},props:{max:{type:Number,"default":5},value:{type:Number,"default":0,twoWay:!0},disabled:{type:Boolean,"default":!1},star:{type:String,"default":"★"},activeColor:{type:String,"default":"#fc6"},margin:{type:Number,"default":2},fontSize:{type:Number,"default":25}},computed:{sliceValue:function(){var t=this.value.toString().split(".");return 1===t.length?[t[0],0]:t},cutIndex:function(){return 1*this.sliceValue[0]},cutPercent:function(){return 10*this.sliceValue[1]}},methods:{handleClick:function(t,e){if(!this.disabled||e){this.value=t+1;for(var s=0;s<this.max;s++)t>=s?this.colors.$set(s,this.activeColor):this.colors.$set(s,"#ccc")}}},data:function(){return{colors:[],cutIndex:-1,cutPercent:0}},watch:{value:function(t){this.handleClick(t-1)}}}},function(t,e){},function(t,e){t.exports="<div class=vux-rater> <a class=vux-rater-box v-for=\"i in max\" @click=handleClick(i) :class=\"{'is-active':value > i}\" :style=\"{color:colors[i],marginRight:margin+'px',fontSize: fontSize + 'px',width: fontSize + 'px',height: fontSize + 'px'}\"> <span class=vux-rater-inner>{{star}}<span class=vux-rater-outer :style=\"{color:activeColor,width: cutPercent + '%'}\" v-if=\"cutPercent > 0 && cutIndex === i\">{{star}}</span></span> </a> </div>"},function(t,e,s){var i,o;s(2),i=s(1),o=s(3),t.exports=i||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)}])})},8:function(t,e,s){t.exports={"default":s(9),__esModule:!0}},9:function(t,e,s){var i=s(10);t.exports=function(t){return(i.JSON&&i.JSON.stringify||JSON.stringify).apply(JSON,arguments)}},10:function(t,e){var s=t.exports={version:"1.2.6"};"number"==typeof __e&&(__e=s)},23:function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={props:["show","selectedProducts"],methods:{minus:function(t){this.$dispatch("minus",t)},plus:function(t,e){this.$dispatch("plus",t)},goCheck:function(){this.$dispatch("go-check")}},computed:{totalPrice:function(){for(var t=0,e=0;e<this.selectedProducts.length;e++)t+=this.selectedProducts[e].price*this.selectedProducts[e].amount;return t}}}},24:function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={methods:{showCart:function(){this.$dispatch("show-cart")},goCheck:function(){this.$dispatch("go-check")}}}},25:function(t,e,s){e=t.exports=s(4)(),e.push([t.id,".shopping_cart_bar{height:50px;background:none repeat scroll 0 0 #fff;bottom:0;margin:0;padding:0;position:fixed}.shopping_cart_bar .weui_tabbar_item{text-align:center;line-height:40px}.shopping_cart_bar .bgea8010{color:#fff;background-color:#ea8010}.shopping_cart_bar .bgeb4f38{color:#fff;background-color:#eb4f38}","",{version:3,sources:["/./src/components/shopping-cart.vue"],names:[],mappings:"AAAA,mBAAmB,YAAY,uCAAuC,SAAS,SAAS,UAAU,cAAc,CAAC,qCAAqC,kBAAkB,gBAAgB,CAAC,6BAA6B,WAAW,wBAAwB,CAAC,6BAA6B,WAAW,wBAAwB,CAAC",file:"shopping-cart.vue",sourcesContent:[".shopping_cart_bar{height:50px;background:none repeat scroll 0 0 #FFF;bottom:0;margin:0;padding:0;position:fixed}.shopping_cart_bar .weui_tabbar_item{text-align:center;line-height:40px}.shopping_cart_bar .bgea8010{color:#fff;background-color:#ea8010}.shopping_cart_bar .bgeb4f38{color:#fff;background-color:#eb4f38}\n"],sourceRoot:"webpack://"}])},26:function(t,e,s){var i=s(25);"string"==typeof i&&(i=[[t.id,i,""]]);s(5)(i,{});i.locals&&(t.exports=i.locals)},35:function(t,e){t.exports='<div class=actionsheet_wrap> <div class=weui_mask_transition :class="{\'weui_fade_toggle\': show}" :style="{display: show ? \'block\' : \'none\'}" @click="show=false"></div> <div class=weui_actionsheet :class="{\'weui_actionsheet_toggle\': show}"> <div class=weui_actionsheet_menu> <div class=weui_actionsheet_cell style=background-color:#EEE> <div class=container> <div class=left style=text-align:left;padding-left:20px> <span class="" style="border-left:solid 2px #00f;font-size:15px;padding-left:10px">购物车</span> </div> <div class=right style=text-align:right;padding-right:20px> <button class="button button-small button-action"> <i class="fa fa-trash-o"></i> 清空 </button> </div> </div> </div> <div class=weui_actionsheet_cell v-for="product in selectedProducts"> <div class=container> <div class=left style=width:150px> <span style=font-size:16px>{{product.name}}</span> <span style=font-size:14px;color:red>￥ {{product.price}}</span> </div> <div class=right style=text-align:right;padding-right:20px> <button class="button button-action button-circle button-tiny" @click=minus(product)> <i class="fa fa-minus"></i> </button> {{product.amount}} <button class="button button-action button-circle button-tiny add-product" @click="plus(product, $event)"> <i class="fa fa-plus"></i> </button> </div> </div> </div> <div class=weui_actionsheet_cell style=background-color:#EEE> <div class=container> <div class=left style=text-align:left;padding-left:20px> <span class="" style="border-left:solid 2px red;font-size:15px;padding-left:10px">￥ {{totalPrice}}</span> </div> <div class=right style=text-align:right;padding-right:20px> <button @click=goCheck class="button button-small button-caution"> <i class="fa fa-trash-o"></i> 结算 </button> </div> </div> </div> </div> </div> </div>'},36:function(t,e){t.exports='<div class=weui_tab> <div class="weui_tabbar shopping_cart_bar"> <a class=weui_tabbar_item> <slot name=money>￥ 0</slot> </a> <a class="weui_tabbar_item bgea8010" @click=showCart> <i class="fa fa-shopping-cart"></i> 查看购物车 </a> <a class="weui_tabbar_item bgeb4f38" @click=goCheck> 去结算 </a> </div> <div class=weui_tab_bd></div> </div>'},37:function(t,e,s){var i,o;i=s(23),o=s(35),t.exports=i||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)},38:function(t,e,s){var i,o;s(26),i=s(24),o=s(36),t.exports=i||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)},57:function(t,e,s){"use strict";function i(t){return t&&t.__esModule?t:{"default":t}}Object.defineProperty(e,"__esModule",{value:!0});var o=s(8),n=i(o),a=s(7),r=i(a);e["default"]={data:function(){return{product:{},selectedProducts:[]}},route:{data:function(t){this.$http.get("http://jiancan.me/api/u1/products/one.json",{product_id:this.$route.params.product_id}).then(function(t){this.$set("product",t.data),this.loadSelected()},function(t){this.$dispatch("response-msg",t)})}},computed:{totalPrice:function(){for(var t=0,e=0;e<this.selectedProducts.length;e++)t+=this.selectedProducts[e].price*this.selectedProducts[e].amount;return t},buildLink:function(){return"/shops/"+this.product.shop_id}},methods:{saveSelected:function(){localStorage.setItem("jc_"+this.product.shop_id+"_cart",(0,n["default"])(this.selectedProducts))},loadSelected:function(){var t=localStorage.getItem("jc_"+this.product.shop_id+"_cart");null!=t&&(this.selectedProducts=JSON.parse(t))},addProduct:function(t){var e=this.checkSelected(t);0>=e?this.selectedProducts.push({id:t.id,amount:1,name:t.name,price:t.price}):this.selectedProducts[e].amount++,this.saveSelected()},removeProduct:function(t){var e=this.checkSelected(t);e>0&&(this.selectedProducts[e].amount>1?this.selectedProducts[e].amount--:this.selectedProducts.splice(e,1)),this.saveSelected()},checkSelected:function(t){if(!this.selectedProducts)return 0;for(var e=0;e<this.selectedProducts.length;e++)if(t.id===this.selectedProducts[e].id)return this.selectedProducts[e].amount;return 0}},components:{NavigationBar:s(3),ShoppingCart:s(38),ShoppingCartList:s(37),Rater:r["default"]}}},103:function(t,e){t.exports='<navigation-bar :go-back=buildLink> <div slot=middle_content> {{product.name}} </div> <div slot=right_items> <i class="fa fa-heart-o"></i> </div> </navigation-bar> <div class=product_header> <img :src=product.avatar /> <div class=product_card> <div class=content> <a class=header>{{product.name}}</a> <div class=meta> </div> <div class=description> <p></p> </div> <div class=extra> <rater :value.sync=data42 slot=value active-color=#04BE02 :font-size=15 disabled=disabled></rater> </div> </div> <div class=buy> <button class="button button-action button-circle button-tiny" @click=removeProduct(product)> <i class="fa fa-minus"></i> </button> <span v-show=checkSelected(product)>{{checkSelected(product)}}</span> <button class="button button-action button-circle button-tiny add-product" @click=addProduct(product)> <i class="fa fa-plus"></i> </button> </div> </div> </div> <div class=weui_panel> <div class=weui_panel_hd>美食评价</div> <div class=weui_panel_bd> <div class="weui_media_box weui_media_text"> <h4 class=weui_media_title>标题一</h4> <p class=weui_media_desc>由各种物质组成的巨型球状天体，叫做星球。星球有一定的形状，有自己的运行轨道。</p> <ul class=weui_media_info> <li class=weui_media_info_meta>文字来源</li> <li class=weui_media_info_meta>时间</li> <li class="weui_media_info_meta weui_media_info_meta_extra">其它信息</li> </ul> </div> </div> </div> <shopping-cart-list :show.sync=showCart :selected-products=selectedProducts></shopping-cart-list> <shopping-cart> <span slot=money style=color:#56abe4>￥ {{totalPrice}}</span> </shopping-cart>'},127:function(t,e,s){var i,o;i=s(57),o=s(103),t.exports=i||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)}});
//# sourceMappingURL=6.f713444cdd28f83faf3b.js.map