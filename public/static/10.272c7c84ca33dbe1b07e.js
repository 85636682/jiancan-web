webpackJsonp([10],{1:function(e,t){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t["default"]={props:["goBack"],methods:{GoBack:function(){this.$route.router.go({path:this.goBack})}}}},2:function(e,t){e.exports='<div class=navigation_bar> <div class=middle> <slot name=middle_content> </slot> </div> <div class=left> <a class=go_back @click=GoBack> <i class="fa fa-arrow-left"></i> </a> </div> <div class=right> <slot name=right_items> </slot> </div> </div>'},3:function(e,t,i){var s,o;s=i(1),o=i(2),e.exports=s||{},e.exports.__esModule&&(e.exports=e.exports["default"]),o&&(("function"==typeof e.exports?e.exports.options||(e.exports.options={}):e.exports).template=o)},52:function(e,t,i){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t["default"]={data:function(){return{mobile:"",showTip:!1}},methods:{updateMobile:function(){var e=localStorage.getItem("jc_user_access_token");null!=e&&this.$http.put("http://jiancan.me/api/u1/users/current.json",{access_token:e,user:{mobile:this.mobile}}).then(function(e){this.showTip=!0},function(e){this.$dispatch("response-msg",e)})}},components:{NavigationBar:i(3)}}},96:function(e,t){e.exports='<navigation-bar go-back=/profile> <div slot=middle_content> 绑定手机 </div> </navigation-bar> <div class=weui_cells_title>绑定手机</div> <div class=weui_cells> <div class="weui_cell weui_cell_select weui_select_before"> <div class=weui_cell_hd> <select class=weui_select name=select2> <option value=1>+86</option> <option value=2>+80</option> <option value=3>+84</option> <option value=4>+87</option> </select> </div> <div class="weui_cell_bd weui_cell_primary"> <input class=weui_input type=number pattern=[0-9]* placeholder=请输入号码 v-model=mobile /> </div> </div> </div> <div style=width:100%;height:30px></div> <div class="bd spacing"> <a href=javascript:; class="weui_btn weui_btn_primary">按钮</a> </div> <div id=toast v-show=showTip> <div class=weui_mask_transparent></div> <div class=weui_toast> <i class=weui_icon_toast></i> <p class=weui_toast_content>已完成</p> </div> </div>'},114:function(e,t,i){var s,o;s=i(52),o=i(96),e.exports=s||{},e.exports.__esModule&&(e.exports=e.exports["default"]),o&&(("function"==typeof e.exports?e.exports.options||(e.exports.options={}):e.exports).template=o)}});
//# sourceMappingURL=10.272c7c84ca33dbe1b07e.js.map