webpackJsonp([15],{1:function(o,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={methods:{GoBack:function(){this.$route.router.go(window.history.back())}}}},2:function(o,e){o.exports='<div class="navbar navbar-light bg-faded navigation"> <a class="nav-link btn btn-primary-outline btn-sm" @click=GoBack> <i class="fa fa-arrow-left"></i> 返回 </a> <slot name=title></slot> <slot name=right-content></slot> </div>'},3:function(o,e,t){var r,s;r=t(1),s=t(2),o.exports=r||{},o.exports.__esModule&&(o.exports=o.exports["default"]),s&&(("function"==typeof o.exports?o.exports.options||(o.exports.options={}):o.exports).template=s)},91:function(o,e,t){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var r=t(4);e["default"]={vuex:{getters:{isLogged:function(o){return o.merchant.isLogged},access_token:function(o){return o.merchant.merchant.access_token}},actions:{showAlert:r.showAlert,showLoading:r.showLoading,hideLoading:r.hideLoading}},data:function(){return{worker:{name:"",login:"",department:"",password:"",password_confirmation:""}}},route:{data:function(o){this.showLoading();var e=this.$route.params;this.$http.get("http://jiancan.me/api/m1/workers/one.json",{access_token:this.access_token,worker_id:e.worker_id}).then(function(e){o.next({worker:e.data})},function(o){this.showAlert(o.data.error)}),this.hideLoading()}},methods:{update:function(){this.showLoading();var o=new FormData;o.append("access_token",this.access_token),o.append("worker_id",this.$route.params.worker_id),o.append("worker[name]",this.worker.name),o.append("worker[login]",this.worker.login),o.append("worker[department]",this.worker.department),o.append("worker[password]",this.worker.password),o.append("worker[password_confirmation]",this.worker.password_confirmation),this.$http.put("http://jiancan.me/api/m1/workers/one.json",o).then(function(o){this.$set("worker",o.data),this.$route.router.go({path:"/workers"})},function(o){this.showAlert(o.data.error)}),this.hideLoading()}},components:{"nav-bar":t(3)}}},127:function(o,e){o.exports='<nav-bar> <span slot=title class=title>员工管理 - {{worker.name}}</span> </nav-bar> <div class=content-form> <form @submit=update> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">员工名称</label> <div class=col-sm-10> <input class=form-control placeholder=名称 type=text v-model=worker.name /> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">所属部门</label> <div class=col-sm-10> <select prompt=请选择 class=c-select v-model=worker.department> <option value=waiter>前台</option> <option selected=selected value=kitchen>厨房</option> <option value=counter>总台</option> </select> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">员工账号</label> <div class=col-sm-10> <input class=form-control placeholder=员工账号 type=text v-model=worker.login /> </div> </div> <div class="form-group row"> <label for=inputPassword3 class="col-sm-2 form-control-label">输入密码</label> <div class=col-sm-10> <input class=form-control placeholder=输入密码 type=password v-model=worker.password /> </div> </div> <div class="form-group row"> <label for=inputPassword3 class="col-sm-2 form-control-label">确认密码</label> <div class=col-sm-10> <input class=form-control placeholder=确认密码 type=password v-model=worker.password_confirmation /> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label"></label> <div class=col-sm-10> <input type=submit name=commit value="保 存" class="btn btn-primary"/> </div> </div> </form> </div>'},154:function(o,e,t){var r,s;r=t(91),s=t(127),o.exports=r||{},o.exports.__esModule&&(o.exports=o.exports["default"]),s&&(("function"==typeof o.exports?o.exports.options||(o.exports.options={}):o.exports).template=s)}});
//# sourceMappingURL=15.505604c7d3fa5ca73ad3.js.map