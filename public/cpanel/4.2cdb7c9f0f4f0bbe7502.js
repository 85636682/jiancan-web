webpackJsonp([4],{1:function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={methods:{GoBack:function(){this.$route.router.go(window.history.back())}}}},2:function(t,e){t.exports='<div class="navbar navbar-light bg-faded navigation"> <a class="nav-link btn btn-primary-outline btn-sm" @click=GoBack> <i class="fa fa-arrow-left"></i> 返回 </a> <slot name=title></slot> <slot name=right-content></slot> </div>'},3:function(t,e,o){var s,a;s=o(1),a=o(2),t.exports=s||{},t.exports.__esModule&&(t.exports=t.exports["default"]),a&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=a)},5:function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={props:{show:{type:Boolean,required:!0,twoWay:!0}},data:function(){return{showModal:!1}}}},7:function(t,e,o){e=t.exports=o(8)(),e.push([t.id,".modal-mask{position:fixed;z-index:9998;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,.5);display:table;-webkit-transition:opacity .3s ease;transition:opacity .3s ease}.modal-wrapper{display:table-cell;vertical-align:middle}.modal-container{width:100%;max-width:500px;margin:0 auto;padding:20px 30px;background-color:#fff;border-radius:2px;box-shadow:0 2px 8px rgba(0,0,0,.33);-webkit-transition:all .3s ease;transition:all .3s ease;font-family:Helvetica,Arial,sans-serif}.modal-header h3{margin-top:0;color:#42b983}.modal-body{margin:20px 0}.modal-default-button{float:right}.modal-enter,.modal-leave{opacity:0}.modal-enter .modal-container,.modal-leave .modal-container{-webkit-transform:scale(1.1);transform:scale(1.1)}","",{version:3,sources:["/./src/components/modal-mask/new-object.vue"],names:[],mappings:"AAAA,YAAY,eAAe,aAAa,MAAM,OAAO,WAAW,YAAY,gCAAiC,cAAc,oCAAoC,2BAA2B,CAAC,eAAe,mBAAmB,qBAAqB,CAAC,iBAAiB,WAAW,gBAAgB,cAAgB,kBAAkB,sBAAsB,kBAAkB,qCAAsC,gCAAgC,wBAAwB,sCAAwC,CAAC,iBAAiB,aAAa,aAAa,CAAC,YAAY,aAAa,CAAC,sBAAsB,WAAW,CAAC,0BAA0B,SAAS,CAAC,4DAA4D,6BAA6B,oBAAoB,CAAC",file:"new-object.vue",sourcesContent:[".modal-mask{position:fixed;z-index:9998;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,0.5);display:table;-webkit-transition:opacity .3s ease;transition:opacity .3s ease}.modal-wrapper{display:table-cell;vertical-align:middle}.modal-container{width:100%;max-width:500px;margin:0px auto;padding:20px 30px;background-color:#fff;border-radius:2px;box-shadow:0 2px 8px rgba(0,0,0,0.33);-webkit-transition:all .3s ease;transition:all .3s ease;font-family:Helvetica, Arial, sans-serif}.modal-header h3{margin-top:0;color:#42b983}.modal-body{margin:20px 0}.modal-default-button{float:right}.modal-enter,.modal-leave{opacity:0}.modal-enter .modal-container,.modal-leave .modal-container{-webkit-transform:scale(1.1);transform:scale(1.1)}\n"],sourceRoot:"webpack://"}])},8:function(t,e){t.exports=function(){var t=[];return t.toString=function(){for(var t=[],e=0;e<this.length;e++){var o=this[e];o[2]?t.push("@media "+o[2]+"{"+o[1]+"}"):t.push(o[1])}return t.join("")},t.i=function(e,o){"string"==typeof e&&(e=[[null,e,""]]);for(var s={},a=0;a<this.length;a++){var i=this[a][0];"number"==typeof i&&(s[i]=!0)}for(a=0;a<e.length;a++){var n=e[a];"number"==typeof n[0]&&s[n[0]]||(o&&!n[2]?n[2]=o:o&&(n[2]="("+n[2]+") and ("+o+")"),t.push(n))}},t}},9:function(t,e,o){var s=o(7);"string"==typeof s&&(s=[[t.id,s,""]]);o(12)(s,{});s.locals&&(t.exports=s.locals)},10:function(t,e){t.exports='<div class=modal-mask v-show=show transition=modal> <div class=modal-wrapper> <div class=modal-container> <div class=modal-header> <slot name=header> <span>Title</span> </slot> <i class="fa fa-close pull-xs-right" @click="show = false"></i> </div> <div class=modal-body> <slot name=body> default body </slot> </div> <div class=modal-footer> <slot name=footer> </slot> </div> </div> </div> </div>'},11:function(t,e,o){var s,a;o(9),s=o(5),a=o(10),t.exports=s||{},t.exports.__esModule&&(t.exports=t.exports["default"]),a&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=a)},12:function(t,e,o){function s(t,e){for(var o=0;o<t.length;o++){var s=t[o],a=p[s.id];if(a){a.refs++;for(var i=0;i<a.parts.length;i++)a.parts[i](s.parts[i]);for(;i<s.parts.length;i++)a.parts.push(l(s.parts[i],e))}else{for(var n=[],i=0;i<s.parts.length;i++)n.push(l(s.parts[i],e));p[s.id]={id:s.id,refs:1,parts:n}}}}function a(t){for(var e=[],o={},s=0;s<t.length;s++){var a=t[s],i=a[0],n=a[1],r=a[2],l=a[3],c={css:n,media:r,sourceMap:l};o[i]?o[i].parts.push(c):e.push(o[i]={id:i,parts:[c]})}return e}function i(t,e){var o=h(),s=v[v.length-1];if("top"===t.insertAt)s?s.nextSibling?o.insertBefore(e,s.nextSibling):o.appendChild(e):o.insertBefore(e,o.firstChild),v.push(e);else{if("bottom"!==t.insertAt)throw new Error("Invalid value for parameter 'insertAt'. Must be 'top' or 'bottom'.");o.appendChild(e)}}function n(t){t.parentNode.removeChild(t);var e=v.indexOf(t);e>=0&&v.splice(e,1)}function r(t){var e=document.createElement("style");return e.type="text/css",i(t,e),e}function l(t,e){var o,s,a;if(e.singleton){var i=g++;o=m||(m=r(e)),s=c.bind(null,o,i,!1),a=c.bind(null,o,i,!0)}else o=r(e),s=d.bind(null,o),a=function(){n(o)};return s(t),function(e){if(e){if(e.css===t.css&&e.media===t.media&&e.sourceMap===t.sourceMap)return;s(t=e)}else a()}}function c(t,e,o,s){var a=o?"":s.css;if(t.styleSheet)t.styleSheet.cssText=b(e,a);else{var i=document.createTextNode(a),n=t.childNodes;n[e]&&t.removeChild(n[e]),n.length?t.insertBefore(i,n[e]):t.appendChild(i)}}function d(t,e){var o=e.css,s=e.media,a=e.sourceMap;if(s&&t.setAttribute("media",s),a&&(o+="\n/*# sourceURL="+a.sources[0]+" */",o+="\n/*# sourceMappingURL=data:application/json;base64,"+btoa(unescape(encodeURIComponent(JSON.stringify(a))))+" */"),t.styleSheet)t.styleSheet.cssText=o;else{for(;t.firstChild;)t.removeChild(t.firstChild);t.appendChild(document.createTextNode(o))}}var p={},u=function(t){var e;return function(){return"undefined"==typeof e&&(e=t.apply(this,arguments)),e}},f=u(function(){return/msie [6-9]\b/.test(window.navigator.userAgent.toLowerCase())}),h=u(function(){return document.head||document.getElementsByTagName("head")[0]}),m=null,g=0,v=[];t.exports=function(t,e){e=e||{},"undefined"==typeof e.singleton&&(e.singleton=f()),"undefined"==typeof e.insertAt&&(e.insertAt="bottom");var o=a(t);return s(o,e),function(t){for(var i=[],n=0;n<o.length;n++){var r=o[n],l=p[r.id];l.refs--,i.push(l)}if(t){var c=a(t);s(c,e)}for(var n=0;n<i.length;n++){var l=i[n];if(0===l.refs){for(var d=0;d<l.parts.length;d++)l.parts[d]();delete p[l.id]}}}};var b=function(){var t=[];return function(e,o){return t[e]=o,t.filter(Boolean).join("\n")}}()},58:function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={props:{page:Number,total:Number,pageSize:Number,maxLink:Number},data:function(){return{hasPrev:!1,hasNext:!1}},methods:{setPage:function(t){return t===this.page?!1:(this.page=t,void this.$dispatch("page-change"))}},computed:{units:function o(){function t(t){"number"==typeof t?o.push({page:t,isPrev:!1,isPager:!1,disabled:!1,"class":t===s?"active page-item":"page-item",isNext:!1,html:'<a class="page-link" href="javascript:void(0)">'+t+"</a>"}):o.push({"class":"page-item disabled",page:s,isPager:!1,isPrev:!1,isNext:!0,html:'<a class="page-link disabled" href="javascript:void(0)">...</a>'})}function e(){var t=Math.floor((l-2)/2),e=l-3-t,o=s-t,a=s+e;2>o?o=2:a>r&&(o=r-(l-2));var i=[1];o>2&&i.push("dot");for(var n,c=0,d=l-2;d>c;c++)n=c+o,i.push(n);return r-1>n&&i.push("dot"),r>n&&i.push(r),i}var s=this.page||1,a=this.total||0,i=this.pageSize||10,n=this.maxLink>5?this.maxLink:5,r=Math.ceil(a/i);s>r&&(s=r+0);for(var l=n>r?r:n,o=[],c=e(),d=0;d<c.length;d++)t(c[d]);return o}}}},73:function(t,e,o){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={data:function(){return{showModal:!1,showCategoriesListModal:!1,page:1,offset:10,products:[],showedProducts:[],newProduct:{name:"",price:0,category_id:0},categories:{},categoryPicked:0}},route:{data:function(t){this.$http.get("http://jiancan.me/api/m1/shops/products.json",{access_token:localStorage.token}).then(function(t){this.$set("products",t.data),this.showedProducts=this.products.slice((this.page-1)*this.offset,this.offset)},function(t){this.$dispatch("response-msg",t)}),this.$http.get("http://jiancan.me/api/m1/shops/categories.json",{access_token:localStorage.token}).then(function(t){this.$set("categories",t.data)},function(t){this.$dispatch("response-msg",t)})}},methods:{showForm:function(){this.$set("showModal",!0)},create:function(t){t.preventDefault();var e=new FormData;e.append("access_token",localStorage.token),e.append("product[name]",this.newProduct.name),e.append("product[price]",this.newProduct.price),e.append("product[category_id]",this.newProduct.category_id),this.$http.post("http://jiancan.me/api/m1/products.json",e).then(function(t){this.products.push(t.data),this.newProduct={name:"",price:0,category_id:0},this.showModal=!1},function(t){this.$dispatch("response-msg",t)})},remove:function(t){this.$http["delete"]("http://jiancan.me/api/m1/products/one.json",{access_token:localStorage.token,product_id:t.id}).then(function(e){this.products.$remove(t)},function(t){this.$dispatch("response-msg",t)})},showCategoriesList:function(){this.showCategoriesListModal=!0},filterByCategory:function(t){t.preventDefault(),0===this.categoryPicked?this.$http.get("http://jiancan.me/api/m1/shops/products.json",{access_token:localStorage.token}).then(function(t){this.$set("products",t.data),this.showedProducts=this.products.slice((this.page-1)*this.offset,this.offset)},function(t){this.$dispatch("response-msg",t)}):this.$http.get("http://jiancan.me/api/m1/categories/products.json",{access_token:localStorage.token,category_id:this.categoryPicked}).then(function(t){this.$set("products",t.data),this.showedProducts=this.products},function(t){this.$dispatch("response-msg",t)}),this.showCategoriesListModal=!1}},events:{"page-change":function(){this.showedProducts=this.products.slice((this.page-1)*this.offset,(this.page-1)*this.offset+this.offset)}},components:{"nav-bar":o(3),"new-object":o(11),pagination:o(115)}}},88:function(t,e){t.exports='<nav> <ul class=pagination> <li v-for="unit in units" @click=setPage(unit.page) track-by=$index :class=unit.class> {{{unit.html}}} </li> </ul> </nav>'},103:function(t,e){t.exports='<nav-bar> <span slot=title class=title>菜色管理</span> <a slot=right-content class="nav-link btn btn-primary-outline btn-sm pull-xs-right" @click=showForm> <i class="fa fa-plus"></i> 添加 </a> </nav-bar> <table class=table> <thead> <tr> <th>图片</th> <th>名称 <i class="fa fa-sort"></i></th> <th>价格 <i class="fa fa-sort"></i></th> <th><a @click=showCategoriesList>分类 <i class="fa fa-sort"></i></a></th> <th> 销售量 </th> <th>操作</th> </tr> </thead> <tbody> <tr v-for="product in showedProducts"> <td> <img alt=店铺头像 class=img-circle width=40 height=40 v-bind:src=product.avatar /> </td> <td>{{product.name}}</td> <td>￥{{product.price}}</td> <td>{{product.category.name}}</td> <td>{{product.sales_volume}}</td> <td> <a v-link="\'/product/\'+product.id" class="btn btn-primary-outline btn-sm">修改</a> <button @click=remove(product) class="btn btn-primary-outline btn-sm">删除</button> </td> </tr> </tbody> <tfoot> <tr> <td colspan=6 style=text-align:center> <pagination :page.sync=page :total=products.length></pagination> </td> </tr> </tfoot> </table> <new-object :show.sync=showModal> <span slot=header>创建新菜色</span> <div class=content-form slot=body> <form @submit=create enctype=multipart/form-data accept-charset=UTF-8 method=post> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">名称</label> <div class=col-sm-10> <input class=form-control placeholder=名称 type=text v-model=newProduct.name /> </div> </div> <div class="form-group row"> <label for=inputPassword3 class="col-sm-2 form-control-label">价钱</label> <div class=col-sm-10> <input class=form-control placeholder=价钱 type=text v-model=newProduct.price /> </div> </div> <div class="form-group row"> <label for=inputPassword3 class="col-sm-2 form-control-label">分类</label> <div class=col-sm-10> <select class=c-select v-model=newProduct.category_id> <option v-for="category in categories" track-by=$index v-bind:value=category.id> {{category.name}} </option> </select> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label"></label> <div class=col-sm-10> <input type=submit name=commit value="保 存" class="btn btn-primary"/> </div> </div> </form> </div> </new-object> <new-object :show.sync=showCategoriesListModal> <span slot=header>选择分类</span> <div class=content-form slot=body> <form @submit=filterByCategory enctype=multipart/form-data accept-charset=UTF-8 method=post> <div class="form-group row"> <label for=inputPassword3 class="col-sm-2 form-control-label">分类</label> <div class=col-sm-10 style=padding-top:8px> <label style=margin-right:10px> <input type=radio v-bind:value=0 v-model=categoryPicked>全部 </label> <label v-for="category in categories" track-by=$index style=margin-right:10px> <input type=radio v-bind:value=category.id v-model=categoryPicked>{{category.name}} </label> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label"></label> <div class=col-sm-10> <input type=submit name=commit value="搜 索" class="btn btn-primary"/> </div> </div> </form> </div> </new-object>'},115:function(t,e,o){var s,a;s=o(58),a=o(88),t.exports=s||{},t.exports.__esModule&&(t.exports=t.exports["default"]),a&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=a)},130:function(t,e,o){var s,a;s=o(73),a=o(103),t.exports=s||{},t.exports.__esModule&&(t.exports=t.exports["default"]),a&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=a)}});
//# sourceMappingURL=4.2cdb7c9f0f4f0bbe7502.js.map