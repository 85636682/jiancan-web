webpackJsonp([7],{2:function(t,e,o){!function(e,o){t.exports=o()}(this,function(){return function(t){function e(s){if(o[s])return o[s].exports;var n=o[s]={exports:{},id:s,loaded:!1};return t[s].call(n.exports,n,n.exports,e),n.loaded=!0,n.exports}var o={};return e.m=t,e.c=o,e.p="",e(0)}([function(t,e,o){t.exports=o(4)},function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={props:{leftOptions:{type:Object,"default":function(){return{showBack:!0,backText:"Back",preventGoBack:!1}}},rightOptions:{type:Object,"default":function(){return{showMore:!1}}}},methods:{onClickBack:function(){this.leftOptions.preventGoBack?this.$emit("on-click-back"):history.back()}}}},function(t,e){},function(t,e){t.exports="<div class=x-header> <div class=x-header-left> <a class=x-header-back @click.preventdefault v-show=leftOptions.showBack @click=onClickBack>{{leftOptions.backText}}</a> <slot name=left></slot> </div> <h1 class=x-header-title><slot></slot></h1> <div class=x-header-right> <a class=x-header-more @click.preventdefault @click=\"$emit('on-click-more')\" v-if=rightOptions.showMore></a> <slot name=right></slot> </div> </div>"},function(t,e,o){var s,n;o(2),s=o(1),n=o(3),t.exports=s||{},t.exports.__esModule&&(t.exports=t.exports["default"]),n&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=n)}])})},31:function(t,e,o){"use strict";function s(t){return t&&t.__esModule?t:{"default":t}}Object.defineProperty(e,"__esModule",{value:!0});var n=o(2),r=s(n);e["default"]={data:function(){return{leftOptions:{showBack:!0,backText:"Back",preventGoBack:!0}}},route:{data:function(t){}},methods:{},components:{XHeader:r["default"]}}},96:function(t,e){t.exports="<x-header> 记账本 </x-header>"},122:function(t,e,o){var s,n;s=o(31),n=o(96),t.exports=s||{},t.exports.__esModule&&(t.exports=t.exports["default"]),n&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=n)}});
//# sourceMappingURL=7.5de7c47bc25bb8ab13d7.js.map