webpackJsonp([6],{1:function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={methods:{GoBack:function(){this.$route.router.go(window.history.back())}}}},2:function(t,e){t.exports='<div class="navbar navbar-light bg-faded navigation"> <a class="nav-link btn btn-primary-outline btn-sm" @click=GoBack> <i class="fa fa-arrow-left"></i> 返回 </a> <slot name=title></slot> <slot name=right-content></slot> </div>'},3:function(t,e,o){var a,s;a=o(1),s=o(2),t.exports=a||{},t.exports.__esModule&&(t.exports=t.exports["default"]),s&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=s)},5:function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={props:{show:{type:Boolean,required:!0,twoWay:!0}},data:function(){return{showModal:!1}}}},7:function(t,e,o){e=t.exports=o(8)(),e.push([t.id,".modal-mask{position:fixed;z-index:9998;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,.5);display:table;-webkit-transition:opacity .3s ease;transition:opacity .3s ease}.modal-wrapper{display:table-cell;vertical-align:middle}.modal-container{width:100%;max-width:500px;margin:0 auto;padding:20px 30px;background-color:#fff;border-radius:2px;box-shadow:0 2px 8px rgba(0,0,0,.33);-webkit-transition:all .3s ease;transition:all .3s ease;font-family:Helvetica,Arial,sans-serif}.modal-header h3{margin-top:0;color:#42b983}.modal-body{margin:20px 0}.modal-default-button{float:right}.modal-enter,.modal-leave{opacity:0}.modal-enter .modal-container,.modal-leave .modal-container{-webkit-transform:scale(1.1);transform:scale(1.1)}","",{version:3,sources:["/./src/components/modal-mask/new-object.vue"],names:[],mappings:"AAAA,YAAY,eAAe,aAAa,MAAM,OAAO,WAAW,YAAY,gCAAiC,cAAc,oCAAoC,2BAA2B,CAAC,eAAe,mBAAmB,qBAAqB,CAAC,iBAAiB,WAAW,gBAAgB,cAAgB,kBAAkB,sBAAsB,kBAAkB,qCAAsC,gCAAgC,wBAAwB,sCAAwC,CAAC,iBAAiB,aAAa,aAAa,CAAC,YAAY,aAAa,CAAC,sBAAsB,WAAW,CAAC,0BAA0B,SAAS,CAAC,4DAA4D,6BAA6B,oBAAoB,CAAC",file:"new-object.vue",sourcesContent:[".modal-mask{position:fixed;z-index:9998;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,0.5);display:table;-webkit-transition:opacity .3s ease;transition:opacity .3s ease}.modal-wrapper{display:table-cell;vertical-align:middle}.modal-container{width:100%;max-width:500px;margin:0px auto;padding:20px 30px;background-color:#fff;border-radius:2px;box-shadow:0 2px 8px rgba(0,0,0,0.33);-webkit-transition:all .3s ease;transition:all .3s ease;font-family:Helvetica, Arial, sans-serif}.modal-header h3{margin-top:0;color:#42b983}.modal-body{margin:20px 0}.modal-default-button{float:right}.modal-enter,.modal-leave{opacity:0}.modal-enter .modal-container,.modal-leave .modal-container{-webkit-transform:scale(1.1);transform:scale(1.1)}\n"],sourceRoot:"webpack://"}])},8:function(t,e){t.exports=function(){var t=[];return t.toString=function(){for(var t=[],e=0;e<this.length;e++){var o=this[e];o[2]?t.push("@media "+o[2]+"{"+o[1]+"}"):t.push(o[1])}return t.join("")},t.i=function(e,o){"string"==typeof e&&(e=[[null,e,""]]);for(var a={},s=0;s<this.length;s++){var i=this[s][0];"number"==typeof i&&(a[i]=!0)}for(s=0;s<e.length;s++){var n=e[s];"number"==typeof n[0]&&a[n[0]]||(o&&!n[2]?n[2]=o:o&&(n[2]="("+n[2]+") and ("+o+")"),t.push(n))}},t}},9:function(t,e,o){var a=o(7);"string"==typeof a&&(a=[[t.id,a,""]]);o(12)(a,{});a.locals&&(t.exports=a.locals)},10:function(t,e){t.exports='<div class=modal-mask v-show=show transition=modal> <div class=modal-wrapper> <div class=modal-container> <div class=modal-header> <slot name=header> <span>Title</span> </slot> <i class="fa fa-close pull-xs-right" @click="show = false"></i> </div> <div class=modal-body> <slot name=body> default body </slot> </div> <div class=modal-footer> <slot name=footer> </slot> </div> </div> </div> </div>'},11:function(t,e,o){var a,s;o(9),a=o(5),s=o(10),t.exports=a||{},t.exports.__esModule&&(t.exports=t.exports["default"]),s&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=s)},12:function(t,e,o){function a(t,e){for(var o=0;o<t.length;o++){var a=t[o],s=p[a.id];if(s){s.refs++;for(var i=0;i<s.parts.length;i++)s.parts[i](a.parts[i]);for(;i<a.parts.length;i++)s.parts.push(l(a.parts[i],e))}else{for(var n=[],i=0;i<a.parts.length;i++)n.push(l(a.parts[i],e));p[a.id]={id:a.id,refs:1,parts:n}}}}function s(t){for(var e=[],o={},a=0;a<t.length;a++){var s=t[a],i=s[0],n=s[1],r=s[2],l=s[3],c={css:n,media:r,sourceMap:l};o[i]?o[i].parts.push(c):e.push(o[i]={id:i,parts:[c]})}return e}function i(t,e){var o=m(),a=v[v.length-1];if("top"===t.insertAt)a?a.nextSibling?o.insertBefore(e,a.nextSibling):o.appendChild(e):o.insertBefore(e,o.firstChild),v.push(e);else{if("bottom"!==t.insertAt)throw new Error("Invalid value for parameter 'insertAt'. Must be 'top' or 'bottom'.");o.appendChild(e)}}function n(t){t.parentNode.removeChild(t);var e=v.indexOf(t);e>=0&&v.splice(e,1)}function r(t){var e=document.createElement("style");return e.type="text/css",i(t,e),e}function l(t,e){var o,a,s;if(e.singleton){var i=g++;o=h||(h=r(e)),a=c.bind(null,o,i,!1),s=c.bind(null,o,i,!0)}else o=r(e),a=d.bind(null,o),s=function(){n(o)};return a(t),function(e){if(e){if(e.css===t.css&&e.media===t.media&&e.sourceMap===t.sourceMap)return;a(t=e)}else s()}}function c(t,e,o,a){var s=o?"":a.css;if(t.styleSheet)t.styleSheet.cssText=b(e,s);else{var i=document.createTextNode(s),n=t.childNodes;n[e]&&t.removeChild(n[e]),n.length?t.insertBefore(i,n[e]):t.appendChild(i)}}function d(t,e){var o=e.css,a=e.media,s=e.sourceMap;if(a&&t.setAttribute("media",a),s&&(o+="\n/*# sourceURL="+s.sources[0]+" */",o+="\n/*# sourceMappingURL=data:application/json;base64,"+btoa(unescape(encodeURIComponent(JSON.stringify(s))))+" */"),t.styleSheet)t.styleSheet.cssText=o;else{for(;t.firstChild;)t.removeChild(t.firstChild);t.appendChild(document.createTextNode(o))}}var p={},u=function(t){var e;return function(){return"undefined"==typeof e&&(e=t.apply(this,arguments)),e}},f=u(function(){return/msie [6-9]\b/.test(window.navigator.userAgent.toLowerCase())}),m=u(function(){return document.head||document.getElementsByTagName("head")[0]}),h=null,g=0,v=[];t.exports=function(t,e){e=e||{},"undefined"==typeof e.singleton&&(e.singleton=f()),"undefined"==typeof e.insertAt&&(e.insertAt="bottom");var o=s(t);return a(o,e),function(t){for(var i=[],n=0;n<o.length;n++){var r=o[n],l=p[r.id];l.refs--,i.push(l)}if(t){var c=s(t);a(c,e)}for(var n=0;n<i.length;n++){var l=i[n];if(0===l.refs){for(var d=0;d<l.parts.length;d++)l.parts[d]();delete p[l.id]}}}};var b=function(){var t=[];return function(e,o){return t[e]=o,t.filter(Boolean).join("\n")}}()},68:function(t,e,o){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={data:function(){return{showModal:!1,showCategoriesListModal:!1,offset:10,limit:10,products:[],newProduct:{name:"",price:0,category_id:0},categories:{},categoryPicked:0}},route:{data:function(t){this.$http.get("http://jiancan.me/api/m1/shops/products.json",{access_token:localStorage.token}).then(function(t){this.$set("products",t.data)},function(t){this.$dispatch("response-msg",t)}),this.$http.get("http://jiancan.me/api/m1/shops/categories.json",{access_token:localStorage.token}).then(function(t){this.$set("categories",t.data)},function(t){this.$dispatch("response-msg",t)})}},methods:{showForm:function(){this.$set("showModal",!0)},create:function(t){t.preventDefault();var e=new FormData;e.append("access_token",localStorage.token),e.append("product[name]",this.newProduct.name),e.append("product[price]",this.newProduct.price),e.append("product[category_id]",this.newProduct.category_id),this.$http.post("http://jiancan.me/api/m1/products.json",e).then(function(t){this.products.push(t.data),this.newProduct={name:"",price:0,category_id:0},this.showModal=!1},function(t){this.$dispatch("response-msg",t)})},remove:function(t){this.$http["delete"]("http://jiancan.me/api/m1/products/one.json",{access_token:localStorage.token,product_id:t.id}).then(function(e){this.products.$remove(t)},function(t){this.$dispatch("response-msg",t)})},showCategoriesList:function(){this.showCategoriesListModal=!0},getMoreProducts:function(){this.offset=this.offset+this.limit,this.$http.get("http://jiancan.me/api/m1/shops/products.json",{access_token:localStorage.token,offset:this.offset,limit:this.limit}).then(function(t){this.products=this.products.concat(t.data)},function(t){this.$dispatch("response-msg",t)})},filterByCategory:function(t){t.preventDefault(),0===this.categoryPicked?this.$http.get("http://jiancan.me/api/m1/shops/products.json",{access_token:localStorage.token}).then(function(t){this.$set("products",t.data)},function(t){this.$dispatch("response-msg",t)}):this.$http.get("http://jiancan.me/api/m1/categories/products.json",{access_token:localStorage.token,category_id:this.categoryPicked}).then(function(t){this.$set("products",t.data)},function(t){this.$dispatch("response-msg",t)}),this.showCategoriesListModal=!1}},components:{"nav-bar":o(3),"new-object":o(11)}}},98:function(t,e){t.exports='<nav-bar> <span slot=title class=title>菜色管理</span> <a slot=right-content class="nav-link btn btn-primary-outline btn-sm pull-xs-right" @click=showForm> <i class="fa fa-plus"></i> 添加 </a> </nav-bar> <table class=table> <thead> <tr> <th>图片</th> <th>名称 <i class="fa fa-sort"></i></th> <th>价格 <i class="fa fa-sort"></i></th> <th><a @click=showCategoriesList>分类 <i class="fa fa-sort"></i></a></th> <th> 销售量 </th> <th>操作</th> </tr> </thead> <tbody> <tr v-for="product in products"> <td> <img alt=店铺头像 class=img-circle width=40 height=40 v-bind:src=product.avatar /> </td> <td>{{product.name}}</td> <td>￥{{product.price}}</td> <td>{{product.category.name}}</td> <td>{{product.sales_volume}}</td> <td> <a v-link="\'/products/\'+product.id+\'/edit\'" class="btn btn-primary-outline btn-sm">修改</a> <button @click=remove(product) class="btn btn-primary-outline btn-sm">删除</button> </td> </tr> </tbody> <tfoot> <tr> <td colspan=6 style=text-align:center> <a @click=getMoreProducts class="btn btn-primary">加载更多</a> </td> </tr> </tfoot> </table> <new-object :show.sync=showModal> <span slot=header>创建新菜色</span> <div class=content-form slot=body> <form @submit=create enctype=multipart/form-data accept-charset=UTF-8 method=post> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">名称</label> <div class=col-sm-10> <input class=form-control placeholder=名称 type=text v-model=newProduct.name /> </div> </div> <div class="form-group row"> <label for=inputPassword3 class="col-sm-2 form-control-label">价钱</label> <div class=col-sm-10> <input class=form-control placeholder=价钱 type=text v-model=newProduct.price /> </div> </div> <div class="form-group row"> <label for=inputPassword3 class="col-sm-2 form-control-label">分类</label> <div class=col-sm-10> <select class=c-select v-model=newProduct.category_id> <option v-for="category in categories" track-by=$index v-bind:value=category.id> {{category.name}} </option> </select> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label"></label> <div class=col-sm-10> <input type=submit name=commit value="保 存" class="btn btn-primary"/> </div> </div> </form> </div> </new-object> <new-object :show.sync=showCategoriesListModal> <span slot=header>选择分类</span> <div class=content-form slot=body> <form @submit=filterByCategory enctype=multipart/form-data accept-charset=UTF-8 method=post> <div class="form-group row"> <label for=inputPassword3 class="col-sm-2 form-control-label">分类</label> <div class=col-sm-10 style=padding-top:8px> <label style=margin-right:10px> <input type=radio v-bind:value=0 v-model=categoryPicked>全部 </label> <label v-for="category in categories" track-by=$index style=margin-right:10px> <input type=radio v-bind:value=category.id v-model=categoryPicked>{{category.name}} </label> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label"></label> <div class=col-sm-10> <input type=submit name=commit value="搜 索" class="btn btn-primary"/> </div> </div> </form> </div> </new-object>'},124:function(t,e,o){var a,s;a=o(68),s=o(98),t.exports=a||{},t.exports.__esModule&&(t.exports=t.exports["default"]),s&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=s)}});
//# sourceMappingURL=6.fad88e476bead0c8915a.js.map