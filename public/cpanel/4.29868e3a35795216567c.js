webpackJsonp([4],{1:function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={methods:{GoBack:function(){this.$route.router.go(window.history.back())}}}},2:function(t,e){t.exports='<div class="navbar navbar-light bg-faded navigation"> <a class="nav-link btn btn-primary-outline btn-sm" @click=GoBack> <i class="fa fa-arrow-left"></i> 返回 </a> <slot name=title></slot> <slot name=right-content></slot> </div>'},3:function(t,e,o){var a,s;a=o(1),s=o(2),t.exports=a||{},t.exports.__esModule&&(t.exports=t.exports["default"]),s&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=s)},7:function(t,e){t.exports=function(){var t=[];return t.toString=function(){for(var t=[],e=0;e<this.length;e++){var o=this[e];o[2]?t.push("@media "+o[2]+"{"+o[1]+"}"):t.push(o[1])}return t.join("")},t.i=function(e,o){"string"==typeof e&&(e=[[null,e,""]]);for(var a={},s=0;s<this.length;s++){var i=this[s][0];"number"==typeof i&&(a[i]=!0)}for(s=0;s<e.length;s++){var r=e[s];"number"==typeof r[0]&&a[r[0]]||(o&&!r[2]?r[2]=o:o&&(r[2]="("+r[2]+") and ("+o+")"),t.push(r))}},t}},8:function(t,e,o){function a(t,e){for(var o=0;o<t.length;o++){var a=t[o],s=p[a.id];if(s){s.refs++;for(var i=0;i<s.parts.length;i++)s.parts[i](a.parts[i]);for(;i<a.parts.length;i++)s.parts.push(l(a.parts[i],e))}else{for(var r=[],i=0;i<a.parts.length;i++)r.push(l(a.parts[i],e));p[a.id]={id:a.id,refs:1,parts:r}}}}function s(t){for(var e=[],o={},a=0;a<t.length;a++){var s=t[a],i=s[0],r=s[1],n=s[2],l=s[3],c={css:r,media:n,sourceMap:l};o[i]?o[i].parts.push(c):e.push(o[i]={id:i,parts:[c]})}return e}function i(t,e){var o=f(),a=v[v.length-1];if("top"===t.insertAt)a?a.nextSibling?o.insertBefore(e,a.nextSibling):o.appendChild(e):o.insertBefore(e,o.firstChild),v.push(e);else{if("bottom"!==t.insertAt)throw new Error("Invalid value for parameter 'insertAt'. Must be 'top' or 'bottom'.");o.appendChild(e)}}function r(t){t.parentNode.removeChild(t);var e=v.indexOf(t);e>=0&&v.splice(e,1)}function n(t){var e=document.createElement("style");return e.type="text/css",i(t,e),e}function l(t,e){var o,a,s;if(e.singleton){var i=g++;o=m||(m=n(e)),a=c.bind(null,o,i,!1),s=c.bind(null,o,i,!0)}else o=n(e),a=d.bind(null,o),s=function(){r(o)};return a(t),function(e){if(e){if(e.css===t.css&&e.media===t.media&&e.sourceMap===t.sourceMap)return;a(t=e)}else s()}}function c(t,e,o,a){var s=o?"":a.css;if(t.styleSheet)t.styleSheet.cssText=b(e,s);else{var i=document.createTextNode(s),r=t.childNodes;r[e]&&t.removeChild(r[e]),r.length?t.insertBefore(i,r[e]):t.appendChild(i)}}function d(t,e){var o=e.css,a=e.media,s=e.sourceMap;if(a&&t.setAttribute("media",a),s&&(o+="\n/*# sourceURL="+s.sources[0]+" */",o+="\n/*# sourceMappingURL=data:application/json;base64,"+btoa(unescape(encodeURIComponent(JSON.stringify(s))))+" */"),t.styleSheet)t.styleSheet.cssText=o;else{for(;t.firstChild;)t.removeChild(t.firstChild);t.appendChild(document.createTextNode(o))}}var p={},u=function(t){var e;return function(){return"undefined"==typeof e&&(e=t.apply(this,arguments)),e}},h=u(function(){return/msie [6-9]\b/.test(window.navigator.userAgent.toLowerCase())}),f=u(function(){return document.head||document.getElementsByTagName("head")[0]}),m=null,g=0,v=[];t.exports=function(t,e){e=e||{},"undefined"==typeof e.singleton&&(e.singleton=h()),"undefined"==typeof e.insertAt&&(e.insertAt="bottom");var o=s(t);return a(o,e),function(t){for(var i=[],r=0;r<o.length;r++){var n=o[r],l=p[n.id];l.refs--,i.push(l)}if(t){var c=s(t);a(c,e)}for(var r=0;r<i.length;r++){var l=i[r];if(0===l.refs){for(var d=0;d<l.parts.length;d++)l.parts[d]();delete p[l.id]}}}};var b=function(){var t=[];return function(e,o){return t[e]=o,t.filter(Boolean).join("\n")}}()},9:function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={props:{show:{type:Boolean,required:!0,twoWay:!0}},data:function(){return{showModal:!1}}}},10:function(t,e,o){e=t.exports=o(7)(),e.push([t.id,".modal-mask{position:fixed;z-index:9998;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,.5);display:table;-webkit-transition:opacity .3s ease;transition:opacity .3s ease}.modal-wrapper{display:table-cell;vertical-align:middle}.modal-container{width:100%;max-width:500px;margin:0 auto;padding:20px 30px;background-color:#fff;border-radius:2px;box-shadow:0 2px 8px rgba(0,0,0,.33);-webkit-transition:all .3s ease;transition:all .3s ease;font-family:Helvetica,Arial,sans-serif}.modal-header h3{margin-top:0;color:#42b983}.modal-body{margin:20px 0}.modal-default-button{float:right}.modal-enter,.modal-leave{opacity:0}.modal-enter .modal-container,.modal-leave .modal-container{-webkit-transform:scale(1.1);transform:scale(1.1)}","",{version:3,sources:["/./src/components/modal-mask/new-object.vue"],names:[],mappings:"AAAA,YAAY,eAAe,aAAa,MAAM,OAAO,WAAW,YAAY,gCAAiC,cAAc,oCAAoC,2BAA2B,CAAC,eAAe,mBAAmB,qBAAqB,CAAC,iBAAiB,WAAW,gBAAgB,cAAgB,kBAAkB,sBAAsB,kBAAkB,qCAAsC,gCAAgC,wBAAwB,sCAAwC,CAAC,iBAAiB,aAAa,aAAa,CAAC,YAAY,aAAa,CAAC,sBAAsB,WAAW,CAAC,0BAA0B,SAAS,CAAC,4DAA4D,6BAA6B,oBAAoB,CAAC",file:"new-object.vue",sourcesContent:[".modal-mask{position:fixed;z-index:9998;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,0.5);display:table;-webkit-transition:opacity .3s ease;transition:opacity .3s ease}.modal-wrapper{display:table-cell;vertical-align:middle}.modal-container{width:100%;max-width:500px;margin:0px auto;padding:20px 30px;background-color:#fff;border-radius:2px;box-shadow:0 2px 8px rgba(0,0,0,0.33);-webkit-transition:all .3s ease;transition:all .3s ease;font-family:Helvetica, Arial, sans-serif}.modal-header h3{margin-top:0;color:#42b983}.modal-body{margin:20px 0}.modal-default-button{float:right}.modal-enter,.modal-leave{opacity:0}.modal-enter .modal-container,.modal-leave .modal-container{-webkit-transform:scale(1.1);transform:scale(1.1)}\n"],sourceRoot:"webpack://"}])},11:function(t,e,o){var a=o(10);"string"==typeof a&&(a=[[t.id,a,""]]);o(8)(a,{});a.locals&&(t.exports=a.locals)},12:function(t,e){t.exports='<div class=modal-mask v-show=show transition=modal> <div class=modal-wrapper> <div class=modal-container> <div class=modal-header> <slot name=header> <span>Title</span> </slot> <i class="fa fa-close pull-xs-right" @click="show = false"></i> </div> <div class=modal-body> <slot name=body> default body </slot> </div> <div class=modal-footer> <slot name=footer> </slot> </div> </div> </div> </div>'},13:function(t,e,o){var a,s;o(11),a=o(9),s=o(12),t.exports=a||{},t.exports.__esModule&&(t.exports=t.exports["default"]),s&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=s)},66:function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={props:{page:Number,total:Number,pageSize:Number,maxLink:Number},data:function(){return{hasPrev:!1,hasNext:!1}},methods:{setPage:function(t){return t===this.page?!1:(this.page=t,void this.$dispatch("page-change"))}},computed:{units:function o(){function t(t){"number"==typeof t?o.push({page:t,isPrev:!1,isPager:!1,disabled:!1,"class":t===a?"active page-item":"page-item",isNext:!1,html:'<a class="page-link" href="javascript:void(0)">'+t+"</a>"}):o.push({"class":"page-item disabled",page:a,isPager:!1,isPrev:!1,isNext:!0,html:'<a class="page-link disabled" href="javascript:void(0)">...</a>'})}function e(){var t=Math.floor((l-2)/2),e=l-3-t,o=a-t,s=a+e;2>o?o=2:s>n&&(o=n-(l-2));var i=[1];o>2&&i.push("dot");for(var r,c=0,d=l-2;d>c;c++)r=c+o,i.push(r);return n-1>r&&i.push("dot"),n>r&&i.push(n),i}var a=this.page||1,s=this.total||0,i=this.pageSize||10,r=this.maxLink>5?this.maxLink:5,n=Math.ceil(s/i);a>n&&(a=n+0);for(var l=r>n?n:r,o=[],c=e(),d=0;d<c.length;d++)t(c[d]);return o}}}},77:function(t,e,o){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var a=o(4);e["default"]={vuex:{getters:{isLogged:function(t){return t.merchant.isLogged},access_token:function(t){return t.merchant.merchant.access_token}},actions:{showAlert:a.showAlert,showLoading:a.showLoading,hideLoading:a.hideLoading}},data:function(){return{showModal:!1,showCategoriesListModal:!1,products:[],showedProducts:[],newProduct:{name:"",price:0,category_id:0},categories:{},categoryPicked:0}},route:{data:function(t){this.showLoading(),this.$http.get("http://jiancan.me/api/m1/shops/products.json",{access_token:this.access_token}).then(function(t){this.$set("products",t.data),this.showedProducts=this.products},function(t){this.showAlert(t.data.error)}),this.$http.get("http://jiancan.me/api/m1/shops/categories.json",{access_token:this.access_token}).then(function(t){this.$set("categories",t.data)},function(t){this.showAlert(t.data.error)}),this.hideLoading()}},methods:{showForm:function(){this.$set("showModal",!0)},create:function(){this.showLoading();var t=new FormData;t.append("access_token",this.access_token),t.append("product[name]",this.newProduct.name),t.append("product[price]",this.newProduct.price),t.append("product[category_id]",this.newProduct.category_id),this.$http.post("http://jiancan.me/api/m1/products.json",t).then(function(t){this.showedProducts.push(t.data),this.newProduct={name:"",price:0,category_id:0},this.showModal=!1},function(t){this.showAlert(t.data.error)}),this.hideLoading()},remove:function(t){this.showLoading(),this.$http["delete"]("http://jiancan.me/api/m1/products/one.json",{access_token:this.access_token,product_id:t.id}).then(function(e){this.products.$remove(t)},function(t){this.showAlert(t.data.error)}),this.hideLoading()},showCategoriesList:function(){this.showCategoriesListModal=!0},filterByCategory:function(){var t=this;this.showLoading(),0===this.categoryPicked?this.showedProducts=this.products:this.showedProducts=this.products.filter(function(e){return e.category_id===t.categoryPicked}),this.showCategoriesListModal=!1,this.hideLoading()}},components:{"nav-bar":o(3),"new-object":o(13),pagination:o(116)}}},95:function(t,e){t.exports='<nav> <ul class=pagination> <li v-for="unit in units" @click=setPage(unit.page) track-by=$index :class=unit.class> {{{unit.html}}} </li> </ul> </nav>'},106:function(t,e){t.exports='<nav-bar> <span slot=title class=title>菜色管理</span> <a slot=right-content class="nav-link btn btn-primary-outline btn-sm pull-xs-right" @click=showForm> <i class="fa fa-plus"></i> 添加 </a> </nav-bar> <table class=table> <thead> <tr> <th>图片</th> <th>名称 <i class="fa fa-sort"></i></th> <th>价格 <i class="fa fa-sort"></i></th> <th><a @click=showCategoriesList>分类 <i class="fa fa-sort"></i></a></th> <th> 销售量 </th> <th>操作</th> </tr> </thead> <tbody> <tr v-for="product in showedProducts"> <td> <img alt=店铺头像 class=img-circle width=40 height=40 v-bind:src=product.avatar /> </td> <td>{{product.name}}</td> <td>￥{{product.price}}</td> <td>{{product.category.name}}</td> <td>{{product.sales_volume}}</td> <td> <a v-link="\'/product/\'+product.id" class="btn btn-primary-outline btn-sm">修改</a> <button @click=remove(product) class="btn btn-primary-outline btn-sm">删除</button> </td> </tr> </tbody> </table> <new-object :show.sync=showModal> <span slot=header>创建新菜色</span> <div class=content-form slot=body> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">名称</label> <div class=col-sm-10> <input class=form-control placeholder=名称 type=text v-model=newProduct.name /> </div> </div> <div class="form-group row"> <label for=inputPassword3 class="col-sm-2 form-control-label">价钱</label> <div class=col-sm-10> <input class=form-control placeholder=价钱 type=text v-model=newProduct.price /> </div> </div> <div class="form-group row"> <label for=inputPassword3 class="col-sm-2 form-control-label">分类</label> <div class=col-sm-10> <select class=c-select v-model=newProduct.category_id> <option v-for="category in categories" track-by=$index v-bind:value=category.id> {{category.name}} </option> </select> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label"></label> <div class=col-sm-10> <button @click=create class="btn btn-primary">保 存</button> </div> </div> </div> </new-object> <new-object :show.sync=showCategoriesListModal> <span slot=header>选择分类</span> <div class=content-form slot=body> <div class="form-group row"> <label for=inputPassword3 class="col-sm-2 form-control-label">分类</label> <div class=col-sm-10 style=padding-top:8px> <label style=margin-right:10px> <input type=radio v-bind:value=0 v-model=categoryPicked>全部 </label> <label v-for="category in categories" track-by=$index style=margin-right:10px> <input type=radio v-bind:value=category.id v-model=categoryPicked>{{category.name}} </label> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label"></label> <div class=col-sm-10> <button @click=filterByCategory class="btn btn-primary">搜 索</button> </div> </div> </div> </new-object>'},116:function(t,e,o){var a,s;a=o(66),s=o(95),t.exports=a||{},t.exports.__esModule&&(t.exports=t.exports["default"]),s&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=s)},127:function(t,e,o){var a,s;a=o(77),s=o(106),t.exports=a||{},t.exports.__esModule&&(t.exports=t.exports["default"]),s&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=s)}});
//# sourceMappingURL=4.29868e3a35795216567c.js.map