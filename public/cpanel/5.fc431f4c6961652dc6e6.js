webpackJsonp([5],{1:function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={methods:{GoBack:function(){this.$route.router.go(window.history.back())}}}},2:function(t,e){t.exports='<div class="navbar navbar-light bg-faded navigation"> <a class="nav-link btn btn-primary-outline btn-sm" @click=GoBack> <i class="fa fa-arrow-left"></i> 返回 </a> <slot name=title></slot> <slot name=right-content></slot> </div>'},3:function(t,e,o){var a,i;a=o(1),i=o(2),t.exports=a||{},t.exports.__esModule&&(t.exports=t.exports["default"]),i&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=i)},4:function(t,e){t.exports=function(){var t=[];return t.toString=function(){for(var t=[],e=0;e<this.length;e++){var o=this[e];o[2]?t.push("@media "+o[2]+"{"+o[1]+"}"):t.push(o[1])}return t.join("")},t.i=function(e,o){"string"==typeof e&&(e=[[null,e,""]]);for(var a={},i=0;i<this.length;i++){var n=this[i][0];"number"==typeof n&&(a[n]=!0)}for(i=0;i<e.length;i++){var r=e[i];"number"==typeof r[0]&&a[r[0]]||(o&&!r[2]?r[2]=o:o&&(r[2]="("+r[2]+") and ("+o+")"),t.push(r))}},t}},5:function(t,e,o){function a(t,e){for(var o=0;o<t.length;o++){var a=t[o],i=d[a.id];if(i){i.refs++;for(var n=0;n<i.parts.length;n++)i.parts[n](a.parts[n]);for(;n<a.parts.length;n++)i.parts.push(l(a.parts[n],e))}else{for(var r=[],n=0;n<a.parts.length;n++)r.push(l(a.parts[n],e));d[a.id]={id:a.id,refs:1,parts:r}}}}function i(t){for(var e=[],o={},a=0;a<t.length;a++){var i=t[a],n=i[0],r=i[1],s=i[2],l=i[3],p={css:r,media:s,sourceMap:l};o[n]?o[n].parts.push(p):e.push(o[n]={id:n,parts:[p]})}return e}function n(t,e){var o=A(),a=g[g.length-1];if("top"===t.insertAt)a?a.nextSibling?o.insertBefore(e,a.nextSibling):o.appendChild(e):o.insertBefore(e,o.firstChild),g.push(e);else{if("bottom"!==t.insertAt)throw new Error("Invalid value for parameter 'insertAt'. Must be 'top' or 'bottom'.");o.appendChild(e)}}function r(t){t.parentNode.removeChild(t);var e=g.indexOf(t);e>=0&&g.splice(e,1)}function s(t){var e=document.createElement("style");return e.type="text/css",n(t,e),e}function l(t,e){var o,a,i;if(e.singleton){var n=m++;o=h||(h=s(e)),a=p.bind(null,o,n,!1),i=p.bind(null,o,n,!0)}else o=s(e),a=c.bind(null,o),i=function(){r(o)};return a(t),function(e){if(e){if(e.css===t.css&&e.media===t.media&&e.sourceMap===t.sourceMap)return;a(t=e)}else i()}}function p(t,e,o,a){var i=o?"":a.css;if(t.styleSheet)t.styleSheet.cssText=v(e,i);else{var n=document.createTextNode(i),r=t.childNodes;r[e]&&t.removeChild(r[e]),r.length?t.insertBefore(n,r[e]):t.appendChild(n)}}function c(t,e){var o=e.css,a=e.media,i=e.sourceMap;if(a&&t.setAttribute("media",a),i&&(o+="\n/*# sourceURL="+i.sources[0]+" */",o+="\n/*# sourceMappingURL=data:application/json;base64,"+btoa(unescape(encodeURIComponent(JSON.stringify(i))))+" */"),t.styleSheet)t.styleSheet.cssText=o;else{for(;t.firstChild;)t.removeChild(t.firstChild);t.appendChild(document.createTextNode(o))}}var d={},u=function(t){var e;return function(){return"undefined"==typeof e&&(e=t.apply(this,arguments)),e}},f=u(function(){return/msie [6-9]\b/.test(window.navigator.userAgent.toLowerCase())}),A=u(function(){return document.head||document.getElementsByTagName("head")[0]}),h=null,m=0,g=[];t.exports=function(t,e){e=e||{},"undefined"==typeof e.singleton&&(e.singleton=f()),"undefined"==typeof e.insertAt&&(e.insertAt="bottom");var o=i(t);return a(o,e),function(t){for(var n=[],r=0;r<o.length;r++){var s=o[r],l=d[s.id];l.refs--,n.push(l)}if(t){var p=i(t);a(p,e)}for(var r=0;r<n.length;r++){var l=n[r];if(0===l.refs){for(var c=0;c<l.parts.length;c++)l.parts[c]();delete d[l.id]}}}};var v=function(){var t=[];return function(e,o){return t[e]=o,t.filter(Boolean).join("\n")}}()},6:function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={props:{show:{type:Boolean,required:!0,twoWay:!0}},data:function(){return{showModal:!1}}}},7:function(t,e,o){e=t.exports=o(4)(),e.push([t.id,".modal-mask{position:fixed;z-index:9998;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,.5);display:table;-webkit-transition:opacity .3s ease;transition:opacity .3s ease}.modal-wrapper{display:table-cell;vertical-align:middle}.modal-container{width:100%;max-width:500px;margin:0 auto;padding:20px 30px;background-color:#fff;border-radius:2px;box-shadow:0 2px 8px rgba(0,0,0,.33);-webkit-transition:all .3s ease;transition:all .3s ease;font-family:Helvetica,Arial,sans-serif}.modal-header h3{margin-top:0;color:#42b983}.modal-body{margin:20px 0}.modal-default-button{float:right}.modal-enter,.modal-leave{opacity:0}.modal-enter .modal-container,.modal-leave .modal-container{-webkit-transform:scale(1.1);transform:scale(1.1)}","",{version:3,sources:["/./src/components/modal-mask/new-object.vue"],names:[],mappings:"AAAA,YAAY,eAAe,aAAa,MAAM,OAAO,WAAW,YAAY,gCAAiC,cAAc,oCAAoC,2BAA2B,CAAC,eAAe,mBAAmB,qBAAqB,CAAC,iBAAiB,WAAW,gBAAgB,cAAgB,kBAAkB,sBAAsB,kBAAkB,qCAAsC,gCAAgC,wBAAwB,sCAAwC,CAAC,iBAAiB,aAAa,aAAa,CAAC,YAAY,aAAa,CAAC,sBAAsB,WAAW,CAAC,0BAA0B,SAAS,CAAC,4DAA4D,6BAA6B,oBAAoB,CAAC",file:"new-object.vue",sourcesContent:[".modal-mask{position:fixed;z-index:9998;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,0.5);display:table;-webkit-transition:opacity .3s ease;transition:opacity .3s ease}.modal-wrapper{display:table-cell;vertical-align:middle}.modal-container{width:100%;max-width:500px;margin:0px auto;padding:20px 30px;background-color:#fff;border-radius:2px;box-shadow:0 2px 8px rgba(0,0,0,0.33);-webkit-transition:all .3s ease;transition:all .3s ease;font-family:Helvetica, Arial, sans-serif}.modal-header h3{margin-top:0;color:#42b983}.modal-body{margin:20px 0}.modal-default-button{float:right}.modal-enter,.modal-leave{opacity:0}.modal-enter .modal-container,.modal-leave .modal-container{-webkit-transform:scale(1.1);transform:scale(1.1)}\n"],sourceRoot:"webpack://"}])},8:function(t,e,o){var a=o(7);"string"==typeof a&&(a=[[t.id,a,""]]);o(5)(a,{});a.locals&&(t.exports=a.locals)},9:function(t,e){t.exports='<div class=modal-mask v-show=show transition=modal> <div class=modal-wrapper> <div class=modal-container> <div class=modal-header> <slot name=header> <span>Title</span> </slot> <i class="fa fa-close pull-xs-right" @click="show = false"></i> </div> <div class=modal-body> <slot name=body> default body </slot> </div> <div class=modal-footer> <slot name=footer> </slot> </div> </div> </div> </div>'},10:function(t,e,o){var a,i;o(8),a=o(6),i=o(9),t.exports=a||{},t.exports.__esModule&&(t.exports=t.exports["default"]),i&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=i)},70:function(t,e,o){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={data:function(){return{showAddProductModal:!1,coupon:{},categories:[],willSelectProducts:[],selectingProducts:[],selectedProducts:[]}},route:{data:function(t){var e=this.$route.params;this.$http.get("http://jiancan.me/api/m1/coupons/one.json",{access_token:localStorage.token,coupon_id:e.coupon_id}).then(function(t){this.$set("coupon",t.data)},function(t){this.$dispatch("response-msg",t)}),this.$http.get("http://jiancan.me/api/m1/shops/categories.json",{access_token:localStorage.token}).then(function(t){this.$set("categories",t.data)},function(t){this.$dispatch("response-msg",t)})}},methods:{showAddProduct:function(){this.$set("showAddProductModal",!0)},showProducts:function(t){var e=t.target.value;0!==e&&this.$http.get("http://jiancan.me/api/m1/categories/products.json",{access_token:localStorage.token,category_id:e}).then(function(t){this.$set("willSelectProducts",t.data)},function(t){this.$dispatch("response-msg",t)})},addProducts:function(t){t.preventDefault();var e=new FormData;e.append("access_token",localStorage.token),e.append("coupon_id",this.$route.params.coupon_id),e.append("products",this.selectingProducts),this.$http.post("http://jiancan.me/api/m1/coupons/products.json",e).then(function(t){this.$set("coupon",t.data)},function(t){this.$dispatch("response-msg",t)}),this.$set("selectingProducts",[]),this.$set("showAddProductModal",!1)},inputFileClick:function(t){return this.$els.avatar.click()},uploadAvatar:function(t){if(t.preventDefault(),""!==this.$els.avatar.value){var e=new FormData;e.append("access_token",localStorage.token),e.append("coupon_id",this.$route.params.coupon_id),e.append("coupon[avatar]",this.$els.avatar.files[0]),this.$http.put("http://jiancan.me/api/m1/coupons/one.json",e).then(function(t){this.$set("coupon",t.data.coupon)},function(t){this.$dispatch("response-msg",t)})}},uploadImage:function(t){if(t.preventDefault(),""!==this.$els.imageable.value){var e=new FormData;e.append("access_token",localStorage.token),e.append("image[imageable_id]",this.$route.params.coupon_id),e.append("image[imageable_type]","Coupon"),e.append("image[img]",this.$els.imageable.files[0]),this.$http.post("http://jiancan.me/api/m1/images.json",e).then(function(t){this.coupon.images.push(t.data)},function(t){this.$dispatch("response-msg",t)})}},update:function(t){t.preventDefault();var e=new FormData;e.append("access_token",localStorage.token),e.append("coupon_id",this.$route.params.coupon_id),e.append("coupon[title]",this.coupon.title),e.append("coupon[details]",this.coupon.details),e.append("coupon[original_price]",this.coupon.original_price),e.append("coupon[preferential_price]",this.coupon.preferential_price),this.$http.put("http://jiancan.me/api/m1/coupons/one.json",e).then(function(t){this.$set("coupon",t.data.coupon)},function(t){this.$dispatch("response-msg",t)})}},components:{"nav-bar":o(3),"new-object":o(10)}}},85:function(t,e,o){e=t.exports=o(4)(),e.push([t.id,'.weui_uploader_files{list-style:none}.weui_uploader_file{width:79px;height:79px;background:no-repeat 50%;background-size:cover}.weui_uploader_file,.weui_uploader_input_wrp{float:left;margin-right:9px;margin-bottom:9px}.weui_uploader_input_wrp{position:relative;width:77px;height:77px;border:1px solid #d9d9d9}.weui_uploader_input_wrp:after,.weui_uploader_input_wrp:before{content:" ";position:absolute;top:50%;left:50%;-webkit-transform:translate(-50%,-50%);transform:translate(-50%,-50%);background-color:#d9d9d9}.weui_uploader_input_wrp:before{width:2px;height:39.5px}.weui_uploader_input_wrp:after{width:39.5px;height:2px}.weui_uploader_input_wrp:active{border-color:#999}.weui_uploader_input_wrp:active:after,.weui_uploader_input_wrp:active:before{background-color:#999}.weui_uploader_input{position:absolute;z-index:1;top:0;left:0;width:100%;height:100%;opacity:0;-webkit-tap-highlight-color:transparent}',"",{version:3,sources:["/./src/views/coupon.vue"],names:[],mappings:"AAAA,qBAAqB,eAAe,CAAC,oBAAkE,WAAW,YAAY,yBAAmC,qBAAqB,CAAC,6CAA9H,WAAW,iBAAiB,iBAAkB,CAAyN,AAAzI,yBAAoC,kBAAkB,AAAmC,WAAW,YAAY,wBAAwB,CAAC,+DAA+D,YAAY,kBAAkB,QAAQ,SAAS,uCAAwC,+BAAgC,wBAAwB,CAAC,gCAAgC,UAAU,aAAa,CAAC,+BAA+B,aAAa,UAAU,CAAC,gCAAgC,iBAAoB,CAAC,6EAA6E,qBAAwB,CAAC,qBAAqB,kBAAkB,UAAU,MAAM,OAAO,WAAW,YAAY,UAAU,uCAAuC,CAAC",file:"coupon.vue",sourcesContent:['.weui_uploader_files{list-style:none}.weui_uploader_file{float:left;margin-right:9px;margin-bottom:9px;width:79px;height:79px;background:no-repeat center center;background-size:cover}.weui_uploader_input_wrp{float:left;position:relative;margin-right:9px;margin-bottom:9px;width:77px;height:77px;border:1px solid #D9D9D9}.weui_uploader_input_wrp:before,.weui_uploader_input_wrp:after{content:" ";position:absolute;top:50%;left:50%;-webkit-transform:translate(-50%, -50%);transform:translate(-50%, -50%);background-color:#D9D9D9}.weui_uploader_input_wrp:before{width:2px;height:39.5px}.weui_uploader_input_wrp:after{width:39.5px;height:2px}.weui_uploader_input_wrp:active{border-color:#999999}.weui_uploader_input_wrp:active:before,.weui_uploader_input_wrp:active:after{background-color:#999999}.weui_uploader_input{position:absolute;z-index:1;top:0;left:0;width:100%;height:100%;opacity:0;-webkit-tap-highlight-color:transparent}\n'],sourceRoot:"webpack://"}])},86:function(t,e,o){var a=o(85);"string"==typeof a&&(a=[[t.id,a,""]]);o(5)(a,{});a.locals&&(t.exports=a.locals)},103:function(t,e){t.exports='<nav-bar> <span slot=title class=title>活动管理 - {{coupon.title}}</span> </nav-bar> <table class=table> <tr> <td style=width:200px;padding-left:50px> <img @click=inputFileClick alt=店铺头像 class=img-circle width=100 height=100 v-bind:src=coupon.avatar /> <input @change=uploadAvatar v-el:avatar class=avatar type=file accept=image/* style=display:none /> </td> <td colspan=2> <div class=content-form> <form @submit=update accept-charset=UTF-8 method=post> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">主题</label> <div class=col-sm-10> <input class=form-control placeholder=主题 type=text v-model=coupon.title /> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">详情</label> <div class=col-sm-10> <textarea class=form-control rows=3 v-model=coupon.details placeholder=详情></textarea> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">原价格</label> <div class=col-sm-10> <input class=form-control placeholder=奖品数量 type=text v-model=coupon.original_price /> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">优惠价格</label> <div class=col-sm-10> <input class=form-control placeholder=奖品数量 type=text v-model=coupon.preferential_price /> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label"></label> <div class=col-sm-10> <input type=submit name=commit value="保 存" class="btn btn-primary"/> </div> </div> </form> </div> </td> </tr> </table> <table class=table> <tr> <td colspan=4> 参与优惠劵的商品 <a @click=showAddProduct class="btn btn-danger btn-sm pull-xs-right"> <i class="fa fa-plus"></i> </a> </td> </tr> <tr> <td>#</td> <td>商品</td> <td>单价</td> <td>数量</td> </tr> <tr v-for="coupon_product in coupon.coupon_products"> <td width=40><img class=img-circle width=30 height=30 v-bind:src=coupon_product.product.avatar /></td> <td>{{coupon_product.product.name}}</td> <td>￥ {{coupon_product.product.price}}</td> <td>{{coupon_product.amount}} 份</td> </tr> </table> <table class=table> <tr> <td> 展示图片 </td> </tr> <tr> <td> <ul class=weui_uploader_files> <li v-for="image in coupon.images" style="background-image:url({{ image.img520xAuto }})" class=weui_uploader_file></li> <li> <div class=weui_uploader_input_wrp> <input @change=uploadImage v-el:imageable class=weui_uploader_input type=file accept=image/jpg,image/jpeg,image/png,image/gif multiple=multiple /> </div> </li> </ul> </td> </tr> </table> <table class=table> <tr> <td width=150> <p> 活动二维码 </p> </td> <td> <div id=qrcode></div> </td> </tr> <tr> <td width=150> <p> 领取优惠劵人数 </p> </td> <td> <p> {{coupon.coupon_users_count}} 人 </p> </td> </tr> </table> <new-object :show.sync=showAddProductModal> <select slot=header class=c-select @change=showProducts> <option value=0 selected=selected>选择分类</option> <option v-for="category in categories" track-by=$index v-bind:value=category.id> {{category.name}} </option> </select> <div slot=body style=max-height:300px;overflow:auto> <table class=table> <tr v-for="product in willSelectProducts"> <td width=40><img alt=店铺头像 class=img-circle width=30 height=30 v-bind:src=product.avatar /></td> <td>{{product.name}}</td> <td> <label class="c-input c-checkbox"> <input type=checkbox value={{product.id}} v-model=selectingProducts> <span class=c-indicator></span> </label> </td> </tr> </table> </div> <div slot=footer> <a @click=addProducts class="btn btn-success btn-sm pull-xs-right"> <i class="fa fa-save"></i> 保存 </a> </div> </new-object>'},131:function(t,e,o){var a,i;o(86),a=o(70),i=o(103),t.exports=a||{},t.exports.__esModule&&(t.exports=t.exports["default"]),i&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=i)}});
//# sourceMappingURL=5.fc431f4c6961652dc6e6.js.map