webpackJsonp([22],{78:function(t,o){"use strict";Object.defineProperty(o,"__esModule",{value:!0}),o["default"]={data:function(){return{mobile:"",password:""}},methods:{login:function(t){t.preventDefault();var o={mobile:this.mobile,password:this.password};this.$http.post("http://jiancan.me/api/m1/merchants/login.json",o).then(function(t){localStorage.token=t.data.access_token,localStorage.mobile=t.data.mobile,this.$dispatch("authenticated")},function(t){this.$dispatch("response-msg",t)})}}}},108:function(t,o){t.exports='<div class=container-fluid> <div class=row> <div class=col-sm-12 style=height:30px></div> </div> <div class=row> <div class=col-sm-4> </div> <div class=col-sm-4> <div class="card card-block form-section"> <h2><center>登 录</center></h2> <form @submit=login action=/sign_in accept-charset=UTF-8 method=post> <fieldset class=form-group> <label for=merchant_mobile>手机号码</label> <input autofocus=autofocus class=form-control type=text value="" name=mobile v-model=mobile /> </fieldset> <fieldset class=form-group> <label for=merchant_password>密码</label> <input autocomplete=off class=form-control type=password name=password v-model=password /> </fieldset> <input type=submit name=commit value="登 录" class="btn btn-primary btn-lg btn-block"/> </form> </div> </div> <div class=col-sm-4> </div> </div> </div>'},134:function(t,o,s){var e,a;e=s(78),a=s(108),t.exports=e||{},t.exports.__esModule&&(t.exports=t.exports["default"]),a&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=a)}});
//# sourceMappingURL=22.47d7237d3422485095bd.js.map