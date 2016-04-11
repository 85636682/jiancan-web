webpackJsonp([16],{1:function(t,a){"use strict";Object.defineProperty(a,"__esModule",{value:!0}),a["default"]={methods:{GoBack:function(){this.$route.router.go(window.history.back())}}}},2:function(t,a){t.exports='<div class="navbar navbar-light bg-faded navigation"> <a class="nav-link btn btn-primary-outline btn-sm" @click=GoBack> <i class="fa fa-arrow-left"></i> 返回 </a> <slot name=title></slot> <slot name=right-content></slot> </div>'},3:function(t,a,s){var o,e;o=s(1),e=s(2),t.exports=o||{},t.exports.__esModule&&(t.exports=t.exports["default"]),e&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=e)},70:function(t,a,s){"use strict";Object.defineProperty(a,"__esModule",{value:!0}),a["default"]={data:function(){return{merchant:{email:"",name:"",password:"",password_confirmation:"",current_password:""}}},route:{data:function(t){this.$http.get("http://jiancan.me/api/m1/merchants/current.json",{access_token:localStorage.token}).then(function(a){t.next({merchant:a.data})},function(t){this.$dispatch("response-msg",t)})}},methods:{update:function(t){t.preventDefault();var a=new FormData;a.append("access_token",localStorage.token),a.append("merchant[name]",this.merchant.name),a.append("merchant[email]",this.merchant.email),this.$http.put("http://jiancan.me/api/m1/merchants/current.json",a).then(function(t){this.$set("merchant",t.data.merchant)},function(t){this.$dispatch("response-msg",t)})},updatePassword:function(t){t.preventDefault();var a=new FormData;a.append("access_token",localStorage.token),a.append("merchant[password]",this.merchant.name),a.append("merchant[password_confirmation]",this.merchant.password_confirmation),a.append("merchant[current_password]",this.merchant.current_password),this.$http.put("http://jiancan.me/api/m1/merchants/current/password.json",a).then(function(t){this.$set("merchant",t.data.merchant)},function(t){this.$dispatch("response-msg",t)})}},components:{"nav-bar":s(3)}}},102:function(t,a){t.exports='<nav-bar> <span slot=title class=title>账号管理</span> </nav-bar> <div class=content-form> <h5><i class="fa fa-database"></i> 修改资料</h5> <form @submit=update accept-charset=UTF-8> <div class="form-group row"> <label class="col-sm-2 form-control-label" for=merchant_email>邮箱</label> <div class=col-sm-10> <input v-model=merchant.email class=form-control type=text /> </div> </div> <div class="form-group row"> <label class="col-sm-2 form-control-label" for=merchant_name>用户名</label> <div class=col-sm-10> <input v-model=merchant.name class=form-control type=text /> </div> </div> <div class="form-group row"> <div class="col-sm-offset-2 col-sm-10"> <input type=submit name=commit value=保存 class="btn btn-primary"/> </div> </div> </form> <br/> <h5><i class="fa fa-key"></i> 修改密码</h5> <form @submit=updatePassword accept-charset=UTF-8> <div class="form-group row"> <label class="col-sm-2 form-control-label">密码</label> <div class=col-sm-10> <input v-model=merchant.password class=form-control type=password /> </div> </div> <div class="form-group row"> <label class="col-sm-2 form-control-label">确认密码</label> <div class=col-sm-10> <input v-model=merchant.password_confirmation class=form-control type=password /> </div> </div> <div class="form-group row"> <label class="col-sm-2 form-control-label">当前密码</label> <div class=col-sm-10> <input v-model=merchant.current_password class=form-control type=password /> </div> </div> <div class="form-group row"> <div class="col-sm-offset-2 col-sm-10"> <input type=submit name=commit value=保存 class="btn btn-primary"/> </div> </div> </form> </div>'},130:function(t,a,s){var o,e;o=s(70),e=s(102),t.exports=o||{},t.exports.__esModule&&(t.exports=t.exports["default"]),e&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=e)}});
//# sourceMappingURL=16.cdef7c0d69c3fadf4469.js.map