webpackJsonp([14],{1:function(e,t,o){!function(t,o){e.exports=o()}(this,function(){return function(e){function t(s){if(o[s])return o[s].exports;var i=o[s]={exports:{},id:s,loaded:!1};return e[s].call(i.exports,i,i.exports,t),i.loaded=!0,i.exports}var o={};return t.m=e,t.c=o,t.p="",t(0)}([function(e,t,o){e.exports=o(4)},function(e,t){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t["default"]={props:{leftOptions:{type:Object,"default":function(){return{showBack:!0,backText:"Back",preventGoBack:!1}}},rightOptions:{type:Object,"default":function(){return{showMore:!1}}}},methods:{onClickBack:function(){this.leftOptions.preventGoBack?this.$dispatch("on-click-back"):history.back()}}}},function(e,t){},function(e,t){e.exports="<div class=x-header> <div class=x-header-left> <a class=x-header-back @click.preventdefault v-show=leftOptions.showBack @click=onClickBack>{{leftOptions.backText}}</a> <slot name=left></slot> </div> <h1 class=x-header-title><slot></slot></h1> <div class=x-header-right> <a class=x-header-more @click.preventdefault @click=\"$dispatch('on-click-more')\" v-if=rightOptions.showMore></a> <slot name=right></slot> </div> </div>"},function(e,t,o){var s,i;o(2),s=o(1),i=o(3),e.exports=s||{},e.exports.__esModule&&(e.exports=e.exports["default"]),i&&(("function"==typeof e.exports?e.exports.options||(e.exports.options={}):e.exports).template=i)}])})},58:function(e,t,o){"use strict";function s(e){return e&&e.__esModule?e:{"default":e}}Object.defineProperty(t,"__esModule",{value:!0});var i=o(1),c=s(i);t["default"]={data:function(){return{mobile:""}},methods:{updateMobile:function(){var e=localStorage.getItem("jc_user_access_token");null!=e&&this.$http.put("http://jiancan.me/api/u1/users/current.json",{access_token:e,user:{mobile:this.mobile}}).then(function(e){this.$dispatch("show-tip",e)},function(e){this.$dispatch("response-msg",e)})}},components:{XHeader:c["default"]}}},111:function(e,t){e.exports='<x-header>绑定手机</x-header> <div class=weui_cells_title>绑定手机</div> <div class=weui_cells> <div class="weui_cell weui_cell_select weui_select_before"> <div class=weui_cell_hd> <select class=weui_select name=select2> <option value=1>+86</option> <option value=2>+80</option> <option value=3>+84</option> <option value=4>+87</option> </select> </div> <div class="weui_cell_bd weui_cell_primary"> <input class=weui_input type=number pattern=[0-9]* placeholder=请输入号码 v-model=mobile /> </div> </div> </div> <div style=width:100%;height:30px></div> <div class="bd spacing"> <a href=javascript:; class="weui_btn weui_btn_primary" @click=updateMobile>保存</a> </div>'},137:function(e,t,o){var s,i;s=o(58),i=o(111),e.exports=s||{},e.exports.__esModule&&(e.exports=e.exports["default"]),i&&(("function"==typeof e.exports?e.exports.options||(e.exports.options={}):e.exports).template=i)}});
//# sourceMappingURL=14.a01634c4b0a8bca09221.js.map