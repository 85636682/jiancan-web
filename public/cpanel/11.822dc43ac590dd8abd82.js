webpackJsonp([11],{1:function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={methods:{GoBack:function(){this.$route.router.go(window.history.back())}}}},2:function(t,e){t.exports='<div class="navbar navbar-light bg-faded navigation"> <a class="nav-link btn btn-primary-outline btn-sm" @click=GoBack> <i class="fa fa-arrow-left"></i> 返回 </a> <slot name=title></slot> <slot name=right-content></slot> </div>'},3:function(t,e,a){var i,o;i=a(1),o=a(2),t.exports=i||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)},5:function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={props:{show:{type:Boolean,required:!0,twoWay:!0}},data:function(){return{showModal:!1}}}},6:function(t,e,a){e=t.exports=a(7)(),e.push([t.id,".modal-mask{position:fixed;z-index:9998;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,.5);display:table;-webkit-transition:opacity .3s ease;transition:opacity .3s ease}.modal-wrapper{display:table-cell;vertical-align:middle}.modal-container{width:100%;max-width:500px;margin:0 auto;padding:20px 30px;background-color:#fff;border-radius:2px;box-shadow:0 2px 8px rgba(0,0,0,.33);-webkit-transition:all .3s ease;transition:all .3s ease;font-family:Helvetica,Arial,sans-serif}.modal-header h3{margin-top:0;color:#42b983}.modal-body{margin:20px 0}.modal-default-button{float:right}.modal-enter,.modal-leave{opacity:0}.modal-enter .modal-container,.modal-leave .modal-container{-webkit-transform:scale(1.1);transform:scale(1.1)}","",{version:3,sources:["/./src/components/modal-mask/new-object.vue"],names:[],mappings:"AAAA,YAAY,eAAe,aAAa,MAAM,OAAO,WAAW,YAAY,gCAAiC,cAAc,oCAAoC,2BAA2B,CAAC,eAAe,mBAAmB,qBAAqB,CAAC,iBAAiB,WAAW,gBAAgB,cAAgB,kBAAkB,sBAAsB,kBAAkB,qCAAsC,gCAAgC,wBAAwB,sCAAwC,CAAC,iBAAiB,aAAa,aAAa,CAAC,YAAY,aAAa,CAAC,sBAAsB,WAAW,CAAC,0BAA0B,SAAS,CAAC,4DAA4D,6BAA6B,oBAAoB,CAAC",file:"new-object.vue",sourcesContent:[".modal-mask{position:fixed;z-index:9998;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,0.5);display:table;-webkit-transition:opacity .3s ease;transition:opacity .3s ease}.modal-wrapper{display:table-cell;vertical-align:middle}.modal-container{width:100%;max-width:500px;margin:0px auto;padding:20px 30px;background-color:#fff;border-radius:2px;box-shadow:0 2px 8px rgba(0,0,0,0.33);-webkit-transition:all .3s ease;transition:all .3s ease;font-family:Helvetica, Arial, sans-serif}.modal-header h3{margin-top:0;color:#42b983}.modal-body{margin:20px 0}.modal-default-button{float:right}.modal-enter,.modal-leave{opacity:0}.modal-enter .modal-container,.modal-leave .modal-container{-webkit-transform:scale(1.1);transform:scale(1.1)}\n"],sourceRoot:"webpack://"}])},7:function(t,e){t.exports=function(){var t=[];return t.toString=function(){for(var t=[],e=0;e<this.length;e++){var a=this[e];a[2]?t.push("@media "+a[2]+"{"+a[1]+"}"):t.push(a[1])}return t.join("")},t.i=function(e,a){"string"==typeof e&&(e=[[null,e,""]]);for(var i={},o=0;o<this.length;o++){var s=this[o][0];"number"==typeof s&&(i[s]=!0)}for(o=0;o<e.length;o++){var n=e[o];"number"==typeof n[0]&&i[n[0]]||(a&&!n[2]?n[2]=a:a&&(n[2]="("+n[2]+") and ("+a+")"),t.push(n))}},t}},8:function(t,e,a){var i=a(6);"string"==typeof i&&(i=[[t.id,i,""]]);a(11)(i,{});i.locals&&(t.exports=i.locals)},9:function(t,e){t.exports='<div class=modal-mask v-show=show transition=modal> <div class=modal-wrapper> <div class=modal-container> <div class=modal-header> <slot name=header> <span>Title</span> </slot> <i class="fa fa-close pull-xs-right" @click="show = false"></i> </div> <div class=modal-body> <slot name=body> default body </slot> </div> <div class=modal-footer> <slot name=footer> </slot> </div> </div> </div> </div>'},10:function(t,e,a){var i,o;a(8),i=a(5),o=a(9),t.exports=i||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)},11:function(t,e,a){function i(t,e){for(var a=0;a<t.length;a++){var i=t[a],o=p[i.id];if(o){o.refs++;for(var s=0;s<o.parts.length;s++)o.parts[s](i.parts[s]);for(;s<i.parts.length;s++)o.parts.push(l(i.parts[s],e))}else{for(var n=[],s=0;s<i.parts.length;s++)n.push(l(i.parts[s],e));p[i.id]={id:i.id,refs:1,parts:n}}}}function o(t){for(var e=[],a={},i=0;i<t.length;i++){var o=t[i],s=o[0],n=o[1],r=o[2],l=o[3],c={css:n,media:r,sourceMap:l};a[s]?a[s].parts.push(c):e.push(a[s]={id:s,parts:[c]})}return e}function s(t,e){var a=f(),i=b[b.length-1];if("top"===t.insertAt)i?i.nextSibling?a.insertBefore(e,i.nextSibling):a.appendChild(e):a.insertBefore(e,a.firstChild),b.push(e);else{if("bottom"!==t.insertAt)throw new Error("Invalid value for parameter 'insertAt'. Must be 'top' or 'bottom'.");a.appendChild(e)}}function n(t){t.parentNode.removeChild(t);var e=b.indexOf(t);e>=0&&b.splice(e,1)}function r(t){var e=document.createElement("style");return e.type="text/css",s(t,e),e}function l(t,e){var a,i,o;if(e.singleton){var s=h++;a=m||(m=r(e)),i=c.bind(null,a,s,!1),o=c.bind(null,a,s,!0)}else a=r(e),i=d.bind(null,a),o=function(){n(a)};return i(t),function(e){if(e){if(e.css===t.css&&e.media===t.media&&e.sourceMap===t.sourceMap)return;i(t=e)}else o()}}function c(t,e,a,i){var o=a?"":i.css;if(t.styleSheet)t.styleSheet.cssText=g(e,o);else{var s=document.createTextNode(o),n=t.childNodes;n[e]&&t.removeChild(n[e]),n.length?t.insertBefore(s,n[e]):t.appendChild(s)}}function d(t,e){var a=e.css,i=e.media,o=e.sourceMap;if(i&&t.setAttribute("media",i),o&&(a+="\n/*# sourceURL="+o.sources[0]+" */",a+="\n/*# sourceMappingURL=data:application/json;base64,"+btoa(unescape(encodeURIComponent(JSON.stringify(o))))+" */"),t.styleSheet)t.styleSheet.cssText=a;else{for(;t.firstChild;)t.removeChild(t.firstChild);t.appendChild(document.createTextNode(a))}}var p={},u=function(t){var e;return function(){return"undefined"==typeof e&&(e=t.apply(this,arguments)),e}},v=u(function(){return/msie [6-9]\b/.test(window.navigator.userAgent.toLowerCase())}),f=u(function(){return document.head||document.getElementsByTagName("head")[0]}),m=null,h=0,b=[];t.exports=function(t,e){e=e||{},"undefined"==typeof e.singleton&&(e.singleton=v()),"undefined"==typeof e.insertAt&&(e.insertAt="bottom");var a=o(t);return i(a,e),function(t){for(var s=[],n=0;n<a.length;n++){var r=a[n],l=p[r.id];l.refs--,s.push(l)}if(t){var c=o(t);i(c,e)}for(var n=0;n<s.length;n++){var l=s[n];if(0===l.refs){for(var d=0;d<l.parts.length;d++)l.parts[d]();delete p[l.id]}}}};var g=function(){var t=[];return function(e,a){return t[e]=a,t.filter(Boolean).join("\n")}}()},63:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={data:function(){return{showAddProductModal:!1,activity:{title:"",details:"",amount:0,handle:"",likes:0,deadline:"",avatar:""},categories:[],willSelectProducts:[],selectingProducts:[],selectedProducts:[]}},route:{data:function(t){var e=this.$route.params;this.$http.get("http://jiancan.me/api/m1/activities/one.json",{access_token:localStorage.token,activity_id:e.activity_id}).then(function(t){this.$set("activity",t.data)},function(t){this.$dispatch("response-msg",t)}),this.$http.get("http://jiancan.me/api/m1/shops/categories.json",{access_token:localStorage.token}).then(function(t){this.$set("categories",t.data)},function(t){this.$dispatch("response-msg",t)})}},methods:{showAddProduct:function(){this.$set("showAddProductModal",!0)},showProducts:function(t){var e=t.target.value;0!==e&&this.$http.get("http://jiancan.me/api/m1/categories/products.json",{access_token:localStorage.token,category_id:e}).then(function(t){this.$set("willSelectProducts",t.data)},function(t){this.$dispatch("response-msg",t)})},addProducts:function(t){t.preventDefault();var e=new FormData;e.append("access_token",localStorage.token),e.append("activity_id",this.$route.params.activity_id),e.append("products",this.selectingProducts),this.$http.post("http://jiancan.me/api/m1/activities/products.json",e).then(function(t){this.$set("activity",t.data)},function(t){this.$dispatch("response-msg",t)}),this.$set("selectingProducts",[]),this.$set("showAddProductModal",!1)},inputFileClick:function(t){return this.$els.avatar.click()},uploadAvatar:function(t){if(t.preventDefault(),""!==this.$els.avatar.value){var e=new FormData;e.append("access_token",localStorage.token),e.append("activity_id",this.$route.params.activity_id),e.append("activity[avatar]",this.$els.avatar.files[0]),this.$http.put("http://jiancan.me/api/m1/activities/one.json",e).then(function(t){this.$set("activity",t.data.activity)},function(t){this.$dispatch("response-msg",t)})}},update:function(t){t.preventDefault();var e=new FormData;e.append("access_token",localStorage.token),e.append("activity_id",this.$route.params.activity_id),e.append("activity[title]",this.activity.title),e.append("activity[details]",this.activity.details),e.append("activity[amount]",this.activity.amount),e.append("activity[handle]",this.activity.handle),e.append("activity[likes]",this.activity.likes),this.$http.put("http://jiancan.me/api/m1/activities/one.json",e).then(function(t){this.$set("activity",t.data.activity)},function(t){this.$dispatch("response-msg",t)})}},components:{"nav-bar":a(3),"modal-mask":a(10)},ready:function(){jQuery("#qrcode").qrcode({width:80,height:80,text:"http://jiancan.me/weixin/activity?activity_id="+this.$route.params.activity_id})}}},94:function(t,e){t.exports='<nav-bar> <span slot=title class=title>活动管理 - {{activity.title}}</span> </nav-bar> <table class=table> <tr> <td style=width:200px;padding-left:50px> <img @click=inputFileClick alt=店铺头像 class=img-circle width=100 height=100 v-bind:src=activity.avatar /> <input @change=uploadAvatar v-el:avatar class=avatar type=file accept=image/* style=display:none /> </td> <td colspan=2> <div class=content-form> <form @submit=update accept-charset=UTF-8 method=post> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">主题</label> <div class=col-sm-10> <input class=form-control placeholder=主题 type=text v-model=activity.title /> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">详情</label> <div class=col-sm-10> <textarea class=form-control rows=3 v-model=activity.details placeholder=详情></textarea> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">奖品数量</label> <div class=col-sm-10> <input class=form-control placeholder=奖品数量 type=text v-model=activity.amount /> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">抽奖方式</label> <div class=col-sm-10> <select class=c-select v-model=activity.handle> <option value="" selected=selected>请选择</option> <option value=random_extraction>随机抽取</option> <option value=reach_the_limit>集赞数量</option> </select> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">点赞数量</label> <div class=col-sm-10> <input class=form-control placeholder=点赞数量 type=text v-model=activity.likes /> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label"></label> <div class=col-sm-10> <input type=submit name=commit value="保 存" class="btn btn-primary"/> </div> </div> </form> </div> </td> </tr> </table> <table class=table> <tr> <td colspan=4> 参与活动的商品 <a @click=showAddProduct class="btn btn-danger btn-sm pull-xs-right"> <i class="fa fa-plus"></i> </a> </td> </tr> <tr> <td>#</td> <td>商品</td> <td>单价</td> <td>数量</td> </tr> <tr v-for="activity_product in activity.activity_products"> <td width=40><img alt=店铺头像 class=img-circle width=30 height=30 v-bind:src=activity_product.product.avatar /></td> <td>{{activity_product.product.name}}</td> <td>￥ {{activity_product.product.price}}</td> <td>{{activity_product.amount}} 份</td> </tr> </table> <table class=table> <tr> <td width=150> <p> 活动二维码 </p> </td> <td width=100> <div id=qrcode></div> </td> <td> <p> 只要用你的微信扫一扫，就能打开你的活动页面。 然后分享到你的朋友圈，就能让关注你的顾客在活动页面里更好地参加你的活动。 </p> </td> </tr> </table> <table class=table> <tr> <td colspan=2> 参加活动的用户 </td> </tr> <tr v-for="activity_user in activity.activity_users"> <td> {{activity_user.user.nickname}} </td> <td> 已获得 {{activity_user.likes}} 赞 </td> </tr> </table> <new-object :show.sync=showAddProductModal> <select slot=header class=c-select @change=showProducts> <option value=0 selected=selected>选择分类</option> <option v-for="category in categories" track-by=$index v-bind:value=category.id> {{category.name}} </option> </select> <div slot=body style=max-height:300px;overflow:auto> <table class=table> <tr v-for="product in willSelectProducts"> <td width=40><img alt=店铺头像 class=img-circle width=30 height=30 v-bind:src=product.avatar /></td> <td>{{product.name}}</td> <td> <label class="c-input c-checkbox"> <input type=checkbox value={{product.id}} v-model=selectingProducts> <span class=c-indicator></span> </label> </td> </tr> </table> </div> <div slot=footer> <a @click=addProducts class="btn btn-success btn-sm pull-xs-right"> <i class="fa fa-save"></i> 保存 </a> </div> </new-object>'},122:function(t,e,a){var i,o;i=a(63),o=a(94),t.exports=i||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)}});
//# sourceMappingURL=11.822dc43ac590dd8abd82.js.map