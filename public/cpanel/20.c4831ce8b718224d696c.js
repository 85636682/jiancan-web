webpackJsonp([20],{1:function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={methods:{GoBack:function(){this.$route.router.go(window.history.back())}}}},2:function(t,e){t.exports='<div class="navbar navbar-light bg-faded navigation"> <a class="nav-link btn btn-primary-outline btn-sm" @click=GoBack> <i class="fa fa-arrow-left"></i> 返回 </a> <slot name=title></slot> <slot name=right-content></slot> </div>'},3:function(t,e,a){var s,i;s=a(1),i=a(2),t.exports=s||{},t.exports.__esModule&&(t.exports=t.exports["default"]),i&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=i)},59:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={data:function(){return{advertisement:{}}},route:{data:function(t){var e=this.$route.params;this.$http.get("http://jiancan.me/api/m1/shop_advertisements/one.json",{access_token:localStorage.token,shop_advertisement_id:e.advertisement_id}).then(function(e){t.next({advertisement:e.data})},function(t){this.$dispatch("response-msg",t)})}},methods:{inputFileClick:function(t){return this.$els.avatar.click()},uploadAvatar:function(t){if(t.preventDefault(),""!==this.$els.avatar.value){var e=new FormData;e.append("access_token",localStorage.token),e.append("shop_advertisement_id",this.$route.params.advertisement_id),e.append("shop_advertisement[avatar]",this.$els.avatar.files[0]),this.$http.put("http://jiancan.me/api/m1/shop_advertisements/one.json",e).then(function(t){this.$set("advertisement",t.data.shop_advertisement)},function(t){this.$dispatch("response-msg",t)})}},update:function(t){t.preventDefault();var e=new FormData;e.append("access_token",localStorage.token),e.append("shop_advertisement_id",this.$route.params.advertisement_id),e.append("shop_advertisement[title]",this.advertisement.title),e.append("shop_advertisement[content]",this.advertisement.content),e.append("shop_advertisement[divide_into]",this.advertisement.divide_into),this.$http.put("http://jiancan.me/api/m1/shop_advertisements/one.json",e).then(function(t){this.$set("advertisement",t.data.shop_advertisement),this.$route.router.go({path:"/advertisements"})},function(t){this.$dispatch("response-msg",t)})}},components:{"nav-bar":a(3)},ready:function(){jQuery("#qrcode").qrcode({width:80,height:80,text:"http://jiancan.me/weixin/advertisement?advertisement_id="+this.$route.params.advertisement_id})}}},90:function(t,e){t.exports='<nav-bar> <span slot=title class=title>广告管理 - {{advertisement.title}}</span> </nav-bar> <table class=table> <tr> <td style=width:200px;padding-left:50px> <img @click=inputFileClick alt=广告图标 class=img-circle width=100 height=100 v-bind:src=advertisement.avatar /> <input @change=uploadAvatar v-el:avatar class=avatar type=file accept=image/* style=display:none /> </td> <td> <div class=content-form> <form @submit=update> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">广告标题</label> <div class=col-sm-10> <input class=form-control placeholder=名称 type=text v-model=advertisement.title /> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">广告内容</label> <div class=col-sm-10> <input class=form-control placeholder=名称 type=text v-model=advertisement.content /> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">广告分成</label> <div class=col-sm-10> <input class=form-control placeholder=名称 type=text v-model=advertisement.divide_into /> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label"></label> <div class=col-sm-10> <input type=submit name=commit value="保 存" class="btn btn-primary"/> </div> </div> </form> </div> </td> </tr> </table> <table class=table> <tr> <td width=150> <p> 活动二维码 </p> </td> <td width=100> <div id=qrcode></div> </td> <td> <p> 只要用你的微信扫一扫，就能打开你的活动页面。 然后分享到你的朋友圈，就能让关注你的顾客在活动页面里更好地参加你的活动。 </p> </td> </tr> </table> <table class=table> <tr> <td colspan=4> 参加活动的用户 </td> </tr> <tr v-for="shop_advertisement_user in advertisement.shop_advertisement_users"> <td> {{shop_advertisement_user.user.nickname}} </td> <td> 已转发 {{shop_advertisement_user.forwarding_times}} 次 </td> <td> 每次分成 {{advertisement.divide_into}} 元 </td> <td> 总分成 {{advertisement.divide_into * shop_advertisement_user.forwarding_times}} 元 </td> </tr> </table>'},117:function(t,e,a){var s,i;s=a(59),i=a(90),t.exports=s||{},t.exports.__esModule&&(t.exports=t.exports["default"]),i&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=i)}});
//# sourceMappingURL=20.c4831ce8b718224d696c.js.map