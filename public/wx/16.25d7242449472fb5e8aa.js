webpackJsonp([16],{1:function(e,t,o){!function(t,o){e.exports=o()}(this,function(){return function(e){function t(s){if(o[s])return o[s].exports;var i=o[s]={exports:{},id:s,loaded:!1};return e[s].call(i.exports,i,i.exports,t),i.loaded=!0,i.exports}var o={};return t.m=e,t.c=o,t.p="",t(0)}([function(e,t,o){e.exports=o(4)},function(e,t){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t["default"]={props:{leftOptions:{type:Object,"default":function(){return{showBack:!0,backText:"Back",preventGoBack:!1}}},rightOptions:{type:Object,"default":function(){return{showMore:!1}}}},methods:{onClickBack:function(){this.leftOptions.preventGoBack?this.$dispatch("on-click-back"):history.back()}}}},function(e,t){},function(e,t){e.exports="<div class=x-header> <div class=x-header-left> <a class=x-header-back @click.preventdefault v-show=leftOptions.showBack @click=onClickBack>{{leftOptions.backText}}</a> <slot name=left></slot> </div> <h1 class=x-header-title><slot></slot></h1> <div class=x-header-right> <a class=x-header-more @click.preventdefault @click=\"$dispatch('on-click-more')\" v-if=rightOptions.showMore></a> <slot name=right></slot> </div> </div>"},function(e,t,o){var s,i;o(2),s=o(1),i=o(3),e.exports=s||{},e.exports.__esModule&&(e.exports=e.exports["default"]),i&&(("function"==typeof e.exports?e.exports.options||(e.exports.options={}):e.exports).template=i)}])})},46:function(e,t,o){"use strict";function s(e){return e&&e.__esModule?e:{"default":e}}Object.defineProperty(t,"__esModule",{value:!0});var i=o(1),n=s(i);t["default"]={props:["shop_id"],data:function(){return{shop:{},comments:[]}},route:{data:function(e){this.$dispatch("show-loading");var t=this.$route.params;this.$http.get("http://jiancan.me/api/u1/shops/one.json",{shop_id:t.shop_id}).then(function(e){this.$set("shop",e.data),this.$set("comments",this.shop.comments),this.$dispatch("hide-loading")},function(e){this.$dispatch("response-msg",e)})}},computed:{buildLink:function(){return"/shops/"+this.shop.id}},components:{XHeader:n["default"]}}},100:function(e,t){e.exports='<x-header>顾客评论</x-header> <div class=weui_panel> <div class=weui_panel_hd>文字列表附来源</div> <div class=weui_panel_bd> <div class="weui_media_box weui_media_text" v-for="comment in comments"> <h4 class=weui_media_title>{{comment.user.nickname}}</h4> <p class=weui_media_desc>{{comment.content}}</p> <ul class=weui_media_info> <li class=weui_media_info_meta>文字来源</li> <li class=weui_media_info_meta>时间</li> <li class="weui_media_info_meta weui_media_info_meta_extra">其它信息</li> </ul> </div> </div> </div>'},127:function(e,t,o){var s,i;s=o(46),i=o(100),e.exports=s||{},e.exports.__esModule&&(e.exports=e.exports["default"]),i&&(("function"==typeof e.exports?e.exports.options||(e.exports.options={}):e.exports).template=i)}});
//# sourceMappingURL=16.25d7242449472fb5e8aa.js.map