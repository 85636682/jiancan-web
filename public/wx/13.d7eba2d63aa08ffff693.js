webpackJsonp([13],{1:function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={props:["goBack"],methods:{GoBack:function(){this.$route.router.go({path:this.goBack})}}}},2:function(t,e){t.exports='<div class=navigation_bar> <div class=middle> <slot name=middle_content> </slot> </div> <div class=left> <a class=go_back @click=GoBack> <i class="fa fa-arrow-left"></i> </a> </div> <div class=right> <slot name=right_items> </slot> </div> </div>'},3:function(t,e,i){var s,o;s=i(1),o=i(2),t.exports=s||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)},44:function(t,e,i){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={props:["shop_id"],data:function(){return{shop:{},comments:[]}},route:{data:function(t){var e=this.$route.params;this.$http.get("http://jiancan.me/api/u1/shops/one.json",{shop_id:e.shop_id}).then(function(t){this.$set("shop",t.data),this.$set("comments",this.shop.comments)},function(t){this.$dispatch("response-msg",t)})}},computed:{buildLink:function(){return"/shops/"+this.shop.id}},components:{NavigationBar:i(3)}}},91:function(t,e){t.exports='<navigation-bar :go-back=buildLink> <div slot=middle_content> 顾客评论 </div> </navigation-bar> <div class=weui_panel> <div class=weui_panel_hd>文字列表附来源</div> <div class=weui_panel_bd> <div class="weui_media_box weui_media_text" v-for="comment in comments"> <h4 class=weui_media_title>{{comment.user.nickname}}</h4> <p class=weui_media_desc>{{comment.content}}</p> <ul class=weui_media_info> <li class=weui_media_info_meta>文字来源</li> <li class=weui_media_info_meta>时间</li> <li class="weui_media_info_meta weui_media_info_meta_extra">其它信息</li> </ul> </div> </div> </div>'},110:function(t,e,i){var s,o;s=i(44),o=i(91),t.exports=s||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)}});
//# sourceMappingURL=13.d7eba2d63aa08ffff693.js.map