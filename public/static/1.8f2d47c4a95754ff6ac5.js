webpackJsonp([1],[,function(t,r){"use strict";Object.defineProperty(r,"__esModule",{value:!0}),r["default"]={methods:{GoBack:function(){this.$route.router.go(window.history.back())}}}},function(t,r){t.exports='<div class="navbar navbar-light bg-faded navigation"> <a class="nav-link btn btn-primary-outline btn-sm" @click=GoBack> <i class="fa fa-arrow-left"></i> 返回 </a> <slot name=title></slot> <slot name=right-content></slot> </div>'},function(t,r,n){var e,o;e=n(1),o=n(2),t.exports=e||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)},,,function(t,r,n){var e=n(44)("wks"),o=n(48),a=n(15).Symbol;t.exports=function(t){return e[t]||(e[t]=a&&a[t]||(a||o)("Symbol."+t))}},,,,,,,function(t,r){var n=Object;t.exports={create:n.create,getProto:n.getPrototypeOf,isEnum:{}.propertyIsEnumerable,getDesc:n.getOwnPropertyDescriptor,setDesc:n.defineProperty,setDescs:n.defineProperties,getKeys:n.keys,getNames:n.getOwnPropertyNames,getSymbols:n.getOwnPropertySymbols,each:[].forEach}},function(t,r){var n=t.exports={version:"1.2.6"};"number"==typeof __e&&(__e=n)},function(t,r){var n=t.exports="undefined"!=typeof window&&window.Math==Math?window:"undefined"!=typeof self&&self.Math==Math?self:Function("return this")();"number"==typeof __g&&(__g=n)},function(t,r,n){var e=n(13),o=n(23);t.exports=n(34)?function(t,r,n){return e.setDesc(t,r,o(1,n))}:function(t,r,n){return t[r]=n,t}},function(t,r){t.exports={}},,function(t,r,n){var e=n(30);t.exports=function(t,r,n){if(e(t),void 0===r)return t;switch(n){case 1:return function(n){return t.call(r,n)};case 2:return function(n,e){return t.call(r,n,e)};case 3:return function(n,e,o){return t.call(r,n,e,o)}}return function(){return t.apply(r,arguments)}}},function(t,r){t.exports=function(t){if(void 0==t)throw TypeError("Can't call method on  "+t);return t}},function(t,r,n){var e=n(15),o=n(14),a=n(19),i="prototype",u=function(t,r,n){var s,c,f,p=t&u.F,l=t&u.G,d=t&u.S,h=t&u.P,v=t&u.B,x=t&u.W,y=l?o:o[r]||(o[r]={}),g=l?e:d?e[r]:(e[r]||{})[i];l&&(n=r);for(s in n)c=!p&&g&&s in g,c&&s in y||(f=c?g[s]:n[s],y[s]=l&&"function"!=typeof g[s]?n[s]:v&&c?a(f,e):x&&g[s]==f?function(t){var r=function(r){return this instanceof t?new t(r):t(r)};return r[i]=t[i],r}(f):h&&"function"==typeof f?a(Function.call,f):f,h&&((y[i]||(y[i]={}))[s]=f))};u.F=1,u.G=2,u.S=4,u.P=8,u.B=16,u.W=32,t.exports=u},function(t,r){var n={}.hasOwnProperty;t.exports=function(t,r){return n.call(t,r)}},function(t,r){t.exports=function(t,r){return{enumerable:!(1&t),configurable:!(2&t),writable:!(4&t),value:r}}},function(t,r,n){var e=n(13).setDesc,o=n(22),a=n(6)("toStringTag");t.exports=function(t,r,n){t&&!o(t=n?t:t.prototype,a)&&e(t,a,{configurable:!0,value:r})}},function(t,r){var n=Math.ceil,e=Math.floor;t.exports=function(t){return isNaN(t=+t)?0:(t>0?e:n)(t)}},function(t,r){"use strict";t.exports={props:["chartData"],data:function(){return{}},ready:function(){var t=this.$els.chart.getContext("2d");this.myLineChart=new window.Chart(t).Line(this.chartData,{responsive:!0})}}},function(t,r,n){t.exports={"default":n(29),__esModule:!0}},function(t,r,n){"use strict";function e(t){return t&&t.__esModule?t:{"default":t}}r.__esModule=!0;var o=n(27),a=e(o);r["default"]=function(t){if(Array.isArray(t)){for(var r=0,n=Array(t.length);r<t.length;r++)n[r]=t[r];return n}return(0,a["default"])(t)}},function(t,r,n){n(51),n(50),t.exports=n(14).Array.from},function(t,r){t.exports=function(t){if("function"!=typeof t)throw TypeError(t+" is not a function!");return t}},function(t,r,n){var e=n(37);t.exports=function(t){if(!e(t))throw TypeError(t+" is not an object!");return t}},function(t,r,n){var e=n(33),o=n(6)("toStringTag"),a="Arguments"==e(function(){return arguments}());t.exports=function(t){var r,n,i;return void 0===t?"Undefined":null===t?"Null":"string"==typeof(n=(r=Object(t))[o])?n:a?e(r):"Object"==(i=e(r))&&"function"==typeof r.callee?"Arguments":i}},function(t,r){var n={}.toString;t.exports=function(t){return n.call(t).slice(8,-1)}},function(t,r,n){t.exports=!n(35)(function(){return 7!=Object.defineProperty({},"a",{get:function(){return 7}}).a})},function(t,r){t.exports=function(t){try{return!!t()}catch(r){return!0}}},function(t,r,n){var e=n(17),o=n(6)("iterator"),a=Array.prototype;t.exports=function(t){return void 0!==t&&(e.Array===t||a[o]===t)}},function(t,r){t.exports=function(t){return"object"==typeof t?null!==t:"function"==typeof t}},function(t,r,n){var e=n(31);t.exports=function(t,r,n,o){try{return o?r(e(n)[0],n[1]):r(n)}catch(a){var i=t["return"];throw void 0!==i&&e(i.call(t)),a}}},function(t,r,n){"use strict";var e=n(13),o=n(23),a=n(24),i={};n(16)(i,n(6)("iterator"),function(){return this}),t.exports=function(t,r,n){t.prototype=e.create(i,{next:o(1,n)}),a(t,r+" Iterator")}},function(t,r,n){"use strict";var e=n(42),o=n(21),a=n(43),i=n(16),u=n(22),s=n(17),c=n(39),f=n(24),p=n(13).getProto,l=n(6)("iterator"),d=!([].keys&&"next"in[].keys()),h="@@iterator",v="keys",x="values",y=function(){return this};t.exports=function(t,r,n,g,m,b,w){c(n,r,g);var _,M,S=function(t){if(!d&&t in P)return P[t];switch(t){case v:return function(){return new n(this,t)};case x:return function(){return new n(this,t)}}return function(){return new n(this,t)}},D=r+" Iterator",k=m==x,A=!1,P=t.prototype,j=P[l]||P[h]||m&&P[m],O=j||S(m);if(j){var C=p(O.call(new t));f(C,D,!0),!e&&u(P,h)&&i(C,l,y),k&&j.name!==x&&(A=!0,O=function(){return j.call(this)})}if(e&&!w||!d&&!A&&P[l]||i(P,l,O),s[r]=O,s[D]=y,m)if(_={values:k?O:S(x),keys:b?O:S(v),entries:k?S("entries"):O},w)for(M in _)M in P||a(P,M,_[M]);else o(o.P+o.F*(d||A),r,_);return _}},function(t,r,n){var e=n(6)("iterator"),o=!1;try{var a=[7][e]();a["return"]=function(){o=!0},Array.from(a,function(){throw 2})}catch(i){}t.exports=function(t,r){if(!r&&!o)return!1;var n=!1;try{var a=[7],i=a[e]();i.next=function(){n=!0},a[e]=function(){return i},t(a)}catch(u){}return n}},function(t,r){t.exports=!0},function(t,r,n){t.exports=n(16)},function(t,r,n){var e=n(15),o="__core-js_shared__",a=e[o]||(e[o]={});t.exports=function(t){return a[t]||(a[t]={})}},function(t,r,n){var e=n(25),o=n(20);t.exports=function(t){return function(r,n){var a,i,u=String(o(r)),s=e(n),c=u.length;return 0>s||s>=c?t?"":void 0:(a=u.charCodeAt(s),55296>a||a>56319||s+1===c||(i=u.charCodeAt(s+1))<56320||i>57343?t?u.charAt(s):a:t?u.slice(s,s+2):(a-55296<<10)+(i-56320)+65536)}}},function(t,r,n){var e=n(25),o=Math.min;t.exports=function(t){return t>0?o(e(t),9007199254740991):0}},function(t,r,n){var e=n(20);t.exports=function(t){return Object(e(t))}},function(t,r){var n=0,e=Math.random();t.exports=function(t){return"Symbol(".concat(void 0===t?"":t,")_",(++n+e).toString(36))}},function(t,r,n){var e=n(32),o=n(6)("iterator"),a=n(17);t.exports=n(14).getIteratorMethod=function(t){return void 0!=t?t[o]||t["@@iterator"]||a[e(t)]:void 0}},function(t,r,n){"use strict";var e=n(19),o=n(21),a=n(47),i=n(38),u=n(36),s=n(46),c=n(49);o(o.S+o.F*!n(41)(function(t){Array.from(t)}),"Array",{from:function(t){var r,n,o,f,p=a(t),l="function"==typeof this?this:Array,d=arguments,h=d.length,v=h>1?d[1]:void 0,x=void 0!==v,y=0,g=c(p);if(x&&(v=e(v,h>2?d[2]:void 0,2)),void 0==g||l==Array&&u(g))for(r=s(p.length),n=new l(r);r>y;y++)n[y]=x?v(p[y],y):p[y];else for(f=g.call(p),n=new l;!(o=f.next()).done;y++)n[y]=x?i(f,v,[o.value,y],!0):o.value;return n.length=y,n}})},function(t,r,n){"use strict";var e=n(45)(!0);n(40)(String,"String",function(t){this._t=String(t),this._i=0},function(){var t,r=this._t,n=this._i;return n>=r.length?{value:void 0,done:!0}:(t=e(r,n),this._i+=t.length,{value:t,done:!1})})},function(t,r){t.exports="<canvas v-el:chart width=100% height=100%></canvas>"},function(t,r,n){var e,o;e=n(26),o=n(52),t.exports=e||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)},,,,,,,,,,,,,,,,,,,,,,,,function(t,r,n){"use strict";function e(t){return t&&t.__esModule?t:{"default":t}}var o=n(28),a=e(o);t.exports={data:function(){return{chartData:{labels:["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"],datasets:[{label:"My Second dataset",fillColor:"rgba(151,187,205,0.2)",strokeColor:"rgba(151,187,205,1)",pointColor:"rgba(151,187,205,1)",pointStrokeColor:"#fff",pointHighlightFill:"#fff",pointHighlightStroke:"rgba(151,187,205,1)",data:[]}]}}},route:{data:function(t){this.$http.get("http://jiancan.me/api/m1/shops/statistic.json",{access_token:localStorage.token}).then(function(t){this.$set("chartData.datasets[0].data",t.data.shops)},function(t){this.$dispatch("response-msg",t)})}},computed:{maxMonth:function(){return Math.max.apply(Math,(0,a["default"])(this.chartData.datasets[0].data))},minMonth:function(){return Math.min.apply(Math,(0,a["default"])(this.chartData.datasets[0].data))},averageByYear:function(){var t=this.chartData.datasets[0].data.length,r=0;if(t>0){for(var n=0;t>n;n++)r+=Number(this.chartData.datasets[0].data[n]);return(r/t).toFixed(2)}return 0},amountByYear:function(){var t=this.chartData.datasets[0].data.length,r=0;if(t>0){for(var n=0;t>n;n++)r+=Number(this.chartData.datasets[0].data[n]);return r}return 0}},components:{"nav-bar":n(3),"product-sales-volume":n(53)}}},,,,,,,,,,,,,,,,,,,,,,,,,,,,function(t,r){t.exports='<nav-bar> <span slot=title class=title>数据分析</span> </nav-bar> <table class=table> <tr> <td colspan=2>当年月销售量分析</td> </tr> <tr v-if="chartData.datasets[0].data.length > 0"> <td rowspan=11> <div style=width:90%;height:100%> <product-sales-volume :chart-data=chartData></product-sales-volume> </div> </td> <td width=200>最高月份</td> </tr> <tr> <td>￥{{maxMonth}}</td> </tr> <tr> <td>最低月份</td> </tr> <tr> <td>￥{{minMonth}}</td> </tr> <tr> <td>月份平均</td> </tr> <tr> <td>￥{{averageByYear}}</td> </tr> <tr> <td>当年总额</td> </tr> <tr> <td>￥{{amountByYear}}</td> </tr> <tr> <td></td> </tr> <tr> <td></td> </tr> </table>'},,,,,,,,,,,,,,,,,,,,,,,,function(t,r,n){var e,o;e=n(77),o=n(105),t.exports=e||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)}]);
//# sourceMappingURL=1.8f2d47c4a95754ff6ac5.js.map