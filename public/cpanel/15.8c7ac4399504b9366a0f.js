webpackJsonp([15],{1:function(o,t){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t["default"]={methods:{GoBack:function(){this.$route.router.go(window.history.back())}}}},2:function(o,t){o.exports='<div class="navbar navbar-light bg-faded navigation"> <a class="nav-link btn btn-primary-outline btn-sm" @click=GoBack> <i class="fa fa-arrow-left"></i> 返回 </a> <slot name=title></slot> <slot name=right-content></slot> </div>'},3:function(o,t,e){var s,a;s=e(1),a=e(2),o.exports=s||{},o.exports.__esModule&&(o.exports=o.exports["default"]),a&&(("function"==typeof o.exports?o.exports.options||(o.exports.options={}):o.exports).template=a)},75:function(o,t,e){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t["default"]={data:function(){return{room:{name:"",seat:0}}},route:{data:function(o){var t=this.$route.params;this.$http.get("http://jiancan.me/api/m1/rooms/one.json",{access_token:localStorage.token,room_id:t.room_id}).then(function(t){o.next({room:t.data})},function(o){this.$dispatch("response-msg",o)})}},methods:{update:function(o){o.preventDefault();var t=this.$route.params;this.$http.put("http://jiancan.me/api/m1/rooms/one.json",{access_token:localStorage.token,room_id:t.room_id,room:this.room}).then(function(o){this.$route.router.go({path:"/rooms"})},function(o){this.$dispatch("response-msg",o)})}},components:{"nav-bar":e(3)}}},105:function(o,t){o.exports='<nav-bar> <span slot=title class=title>台桌管理 - {{room.name}}</span> </nav-bar> <div class=content-form> <form @submit=update action=/cpanel/rooms accept-charset=UTF-8 method=post> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">分类名称</label> <div class=col-sm-10> <input class=form-control placeholder=名称 type=text v-model=room.name /> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">台桌人数</label> <div class=col-sm-10> <input class=form-control placeholder=人数 type=text v-model=room.seat /> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label"></label> <div class=col-sm-10> <input type=submit name=commit value="保 存" class="btn btn-primary"/> </div> </div> </form> </div>'},132:function(o,t,e){var s,a;s=e(75),a=e(105),o.exports=s||{},o.exports.__esModule&&(o.exports=o.exports["default"]),a&&(("function"==typeof o.exports?o.exports.options||(o.exports.options={}):o.exports).template=a)}});
//# sourceMappingURL=15.8c7ac4399504b9366a0f.js.map