webpackJsonp([17],{1:function(e,o){"use strict";Object.defineProperty(o,"__esModule",{value:!0}),o["default"]={props:["goBack"],methods:{GoBack:function(){this.$route.router.go({path:this.goBack})}}}},2:function(e,o){e.exports='<div class=navigation_bar> <div class=middle> <slot name=middle_content> </slot> </div> <div class=left> <a class=go_back @click=GoBack> <i class="fa fa-arrow-left"></i> </a> </div> <div class=right> <slot name=right_items> </slot> </div> </div>'},3:function(e,o,i){var t,s;t=i(1),s=i(2),e.exports=t||{},e.exports.__esModule&&(e.exports=e.exports["default"]),s&&(("function"==typeof e.exports?e.exports.options||(e.exports.options={}):e.exports).template=s)},52:function(e,o,i){"use strict";Object.defineProperty(o,"__esModule",{value:!0}),o["default"]={data:function(){return{bookings:[]}},route:{data:function(e){this.$http.get("http://jiancan.me/api/u1/bookings.json",{bookingable_type:"Room",access_token:localStorage.jc_user_access_token}).then(function(e){this.$set("bookings",e.data)},function(e){this.$dispatch("response-msg",e)})}},components:{NavigationBar:i(3)}}},98:function(e,o){e.exports='<navigation-bar go-back=/orders> <div slot=middle_content> 订台单 </div> </navigation-bar> <div class=weui_panel> <div class=weui_panel_hd>预定台桌</div> <div class=weui_panel_bd> <div class="weui_media_box weui_media_text" v-for="booking in bookings"> <h4 class=weui_media_title>预定台桌：{{booking.bookingable.room.name}}</h4> <p class=weui_media_desc>来自：{{booking.shop.name}}</p> <ul class=weui_media_info> <li class=weui_media_info_meta>预定时间：{{booking.booking_time}}</li> <li class=weui_media_info_meta></li> <li class="weui_media_info_meta weui_media_info_meta_extra">{{booking.confirmed_text}}</li> </ul> </div> </div> </div>'},121:function(e,o,i){var t,s;t=i(52),s=i(98),e.exports=t||{},e.exports.__esModule&&(e.exports=e.exports["default"]),s&&(("function"==typeof e.exports?e.exports.options||(e.exports.options={}):e.exports).template=s)}});
//# sourceMappingURL=17.8eb3b45cbc66055da8f3.js.map