webpackJsonp([13],{1:function(t,s){"use strict";Object.defineProperty(s,"__esModule",{value:!0}),s["default"]={methods:{GoBack:function(){this.$route.router.go(window.history.back())}}}},2:function(t,s){t.exports='<div class="navbar navbar-light bg-faded navigation"> <a class="nav-link btn btn-primary-outline btn-sm" @click=GoBack> <i class="fa fa-arrow-left"></i> 返回 </a> <slot name=title></slot> <slot name=right-content></slot> </div>'},3:function(t,s,a){var o,e;o=a(1),e=a(2),t.exports=o||{},t.exports.__esModule&&(t.exports=t.exports["default"]),e&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=e)},78:function(t,s,a){"use strict";Object.defineProperty(s,"__esModule",{value:!0});var o=a(4);s["default"]={vuex:{getters:{isLogged:function(t){return t.merchant.isLogged},access_token:function(t){return t.merchant.merchant.access_token}},actions:{showAlert:o.showAlert,showLoading:o.showLoading,hideLoading:o.hideLoading}},data:function(){return{merchant:{email:"",name:"",password:"",password_confirmation:"",current_password:""}}},route:{data:function(t){this.showLoading(),this.$http.get("http://jiancan.me/api/m1/merchants/current.json",{access_token:this.access_token}).then(function(s){t.next({merchant:s.data})},function(t){this.showAlert(t.data.error)}),this.hideLoading()}},methods:{update:function(){this.showLoading();var t=new FormData;t.append("access_token",this.access_token),t.append("merchant[name]",this.merchant.name),t.append("merchant[email]",this.merchant.email),this.$http.put("http://jiancan.me/api/m1/merchants/current.json",t).then(function(t){this.$set("merchant",t.data.merchant)},function(t){this.showAlert(t.data.error)}),this.hideLoading()},updatePassword:function(){this.showLoading();var t=new FormData;t.append("access_token",this.access_token),t.append("merchant[password]",this.merchant.name),t.append("merchant[password_confirmation]",this.merchant.password_confirmation),t.append("merchant[current_password]",this.merchant.current_password),this.$http.put("http://jiancan.me/api/m1/merchants/current/password.json",t).then(function(t){this.$set("merchant",t.data.merchant)},function(t){this.showAlert(t.data.error)}),this.hideLoading()}},components:{"nav-bar":a(3)}}},107:function(t,s){t.exports='<nav-bar> <span slot=title class=title>账号管理</span> </nav-bar> <div class=content-form> <h5><i class="fa fa-database"></i> 修改资料</h5> <form @submit=update accept-charset=UTF-8> <div class="form-group row"> <label class="col-sm-2 form-control-label" for=merchant_email>邮箱</label> <div class=col-sm-10> <input v-model=merchant.email class=form-control type=text /> </div> </div> <div class="form-group row"> <label class="col-sm-2 form-control-label" for=merchant_name>用户名</label> <div class=col-sm-10> <input v-model=merchant.name class=form-control type=text /> </div> </div> <div class="form-group row"> <div class="col-sm-offset-2 col-sm-10"> <input type=submit name=commit value=保存 class="btn btn-primary"/> </div> </div> </form> <br/> <h5><i class="fa fa-key"></i> 修改密码</h5> <form @submit=updatePassword accept-charset=UTF-8> <div class="form-group row"> <label class="col-sm-2 form-control-label">密码</label> <div class=col-sm-10> <input v-model=merchant.password class=form-control type=password /> </div> </div> <div class="form-group row"> <label class="col-sm-2 form-control-label">确认密码</label> <div class=col-sm-10> <input v-model=merchant.password_confirmation class=form-control type=password /> </div> </div> <div class="form-group row"> <label class="col-sm-2 form-control-label">当前密码</label> <div class=col-sm-10> <input v-model=merchant.current_password class=form-control type=password /> </div> </div> <div class="form-group row"> <div class="col-sm-offset-2 col-sm-10"> <input type=submit name=commit value=保存 class="btn btn-primary"/> </div> </div> </form> </div>'},128:function(t,s,a){var o,e;o=a(78),e=a(107),t.exports=o||{},t.exports.__esModule&&(t.exports=t.exports["default"]),e&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=e)}});
//# sourceMappingURL=13.fb0b58fcce9963e53678.js.map