webpackJsonp([14],{1:function(e,s){"use strict";Object.defineProperty(s,"__esModule",{value:!0}),s["default"]={props:["goBack"],methods:{GoBack:function(){this.$route.router.go({path:this.goBack})}}}},2:function(e,s){e.exports='<div class=navigation_bar> <div class=middle> <slot name=middle_content> </slot> </div> <div class=left> <a class=go_back @click=GoBack> <i class="fa fa-arrow-left"></i> </a> </div> <div class=right> <slot name=right_items> </slot> </div> </div>'},3:function(e,s,i){var t,a;t=i(1),a=i(2),e.exports=t||{},e.exports.__esModule&&(e.exports=e.exports["default"]),a&&(("function"==typeof e.exports?e.exports.options||(e.exports.options={}):e.exports).template=a)},55:function(e,s,i){"use strict";Object.defineProperty(s,"__esModule",{value:!0}),s["default"]={data:function(){return{addresses:{},newAddress:{consignee:"",mobile:"",street:""}}},route:{data:function(){var e=localStorage.getItem("jc_user_access_token");null!=e&&this.$http.get("http://jiancan.me/api/u1/receiving_addresses.json",{access_token:e}).then(function(e){this.$set("addresses",e.data)},function(e){this.$dispatch("response-msg",e)})}},methods:{createAddress:function(){var e=localStorage.getItem("jc_user_access_token");if(null!=e){var s=new FormData;s.append("access_token",localStorage.jc_user_access_token),s.append("address[consignee]",this.newAddress.consignee),s.append("address[mobile]",this.newAddress.mobile),s.append("address[street]",this.newAddress.street),this.$http.post("http://jiancan.me/api/u1/receiving_addresses.json",s).then(function(e){this.addresses.push(e.data),this.newAddress={consignee:"",mobile:"",street:""}},function(e){this.$dispatch("response-msg",e)})}}},components:{NavigationBar:i(3)}}},108:function(e,s){e.exports='<navigation-bar go-back=/profile> <div slot=middle_content> 收货地址 </div> </navigation-bar> <div class="weui_panel weui_panel_access"> <div class=weui_panel_bd> <div class="weui_media_box weui_media_text" v-for="address in addresses"> <h3 class=weui_media_title>{{address.consignee}}</h3> <h3 class=weui_media_desc>{{address.street}}</h3> </div> </div> </div> <div class=weui_cells_title>添加地址</div> <div class=weui_cells> <div class=weui_cell> <div class=weui_cell_hd><label class=weui_label>收货人</label></div> <div class="weui_cell_bd weui_cell_primary"> <input class=weui_input type=text v-model=newAddress.consignee /> </div> </div> <div class=weui_cell> <div class=weui_cell_hd><label class=weui_label>电话</label></div> <div class="weui_cell_bd weui_cell_primary"> <input class=weui_input type=text placeholder="" v-model=newAddress.mobile /> </div> </div> <div class=weui_cell> <div class=weui_cell_hd><label class=weui_label>地址</label></div> <div class="weui_cell_bd weui_cell_primary"> <input class=weui_input type=text placeholder=只要写明街道房屋号即可 v-model=newAddress.street /> </div> </div> </div> <div style=width:100%;height:30px></div> <div class="bd spacing"> <a @click=createAddress class="weui_btn weui_btn_primary">保存</a> </div>'},130:function(e,s,i){var t,a;t=i(55),a=i(108),e.exports=t||{},e.exports.__esModule&&(e.exports=e.exports["default"]),a&&(("function"==typeof e.exports?e.exports.options||(e.exports.options={}):e.exports).template=a)}});
//# sourceMappingURL=14.4218758b8040b054c5a7.js.map