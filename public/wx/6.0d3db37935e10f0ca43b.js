webpackJsonp([6],{1:function(t,e,s){!function(e,s){t.exports=s()}(this,function(){return function(t){function e(o){if(s[o])return s[o].exports;var i=s[o]={exports:{},id:o,loaded:!1};return t[o].call(i.exports,i,i.exports,e),i.loaded=!0,i.exports}var s={};return e.m=t,e.c=s,e.p="",e(0)}([function(t,e,s){t.exports=s(4)},function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={props:{leftOptions:{type:Object,"default":function(){return{showBack:!0,backText:"Back",preventGoBack:!1}}},rightOptions:{type:Object,"default":function(){return{showMore:!1}}}},methods:{onClickBack:function(){this.leftOptions.preventGoBack?this.$dispatch("on-click-back"):history.back()}}}},function(t,e){},function(t,e){t.exports="<div class=x-header> <div class=x-header-left> <a class=x-header-back @click.preventdefault v-show=leftOptions.showBack @click=onClickBack>{{leftOptions.backText}}</a> <slot name=left></slot> </div> <h1 class=x-header-title><slot></slot></h1> <div class=x-header-right> <a class=x-header-more @click.preventdefault @click=\"$dispatch('on-click-more')\" v-if=rightOptions.showMore></a> <slot name=right></slot> </div> </div>"},function(t,e,s){var o,i;s(2),o=s(1),i=s(3),t.exports=o||{},t.exports.__esModule&&(t.exports=t.exports["default"]),i&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=i)}])})},3:function(t,e,s){!function(e,s){t.exports=s()}(this,function(){return function(t){function e(o){if(s[o])return s[o].exports;var i=s[o]={exports:{},id:o,loaded:!1};return t[o].call(i.exports,i,i.exports,e),i.loaded=!0,i.exports}var s={};return e.m=t,e.c=s,e.p="",e(0)}([function(t,e,s){t.exports=s(4)},function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={ready:function(){for(var t=0;t<this.max;t++)this.colors.push("#ccc");this.value&&this.handleClick(this.value-1,!0)},props:{max:{type:Number,"default":5},value:{type:Number,"default":0,twoWay:!0},disabled:{type:Boolean,"default":!1},star:{type:String,"default":"★"},activeColor:{type:String,"default":"#fc6"},margin:{type:Number,"default":2},fontSize:{type:Number,"default":25}},computed:{sliceValue:function(){var t=this.value.toString().split(".");return 1===t.length?[t[0],0]:t},cutIndex:function(){return 1*this.sliceValue[0]},cutPercent:function(){return 10*this.sliceValue[1]}},methods:{handleClick:function(t,e){if(!this.disabled||e){this.value=t+1;for(var s=0;s<this.max;s++)t>=s?this.colors.$set(s,this.activeColor):this.colors.$set(s,"#ccc")}}},data:function(){return{colors:[],cutIndex:-1,cutPercent:0}},watch:{value:function(t){this.handleClick(t-1)}}}},function(t,e){},function(t,e){t.exports="<div class=vux-rater> <a class=vux-rater-box v-for=\"i in max\" @click=handleClick(i) :class=\"{'is-active':value > i}\" :style=\"{color:colors[i],marginRight:margin+'px',fontSize: fontSize + 'px', width: fontSize + 'px', height: fontSize + 'px'}\"> <span class=vux-rater-inner>{{star}}<span class=vux-rater-outer :style=\"{color: activeColor, width: cutPercent + '%'}\" v-if=\"cutPercent > 0 && cutIndex === i\">{{star}}</span></span> </a> </div>"},function(t,e,s){var o,i;s(2),o=s(1),i=s(3),t.exports=o||{},t.exports.__esModule&&(t.exports=t.exports["default"]),i&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=i)}])})},15:function(t,e,s){t.exports={"default":s(16),__esModule:!0}},16:function(t,e,s){var o=s(17);t.exports=function(t){return(o.JSON&&o.JSON.stringify||JSON.stringify).apply(JSON,arguments)}},17:function(t,e){var s=t.exports={version:"1.2.6"};"number"==typeof __e&&(__e=s)},18:function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={props:["show","selectedProducts"],methods:{minus:function(t){this.$dispatch("minus",t)},plus:function(t,e){this.$dispatch("plus",t)},goCheck:function(){this.$dispatch("go-check")}},computed:{totalPrice:function(){for(var t=0,e=0;e<this.selectedProducts.length;e++)t+=this.selectedProducts[e].price*this.selectedProducts[e].amount;return t}}}},19:function(t,e){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e["default"]={methods:{showCart:function(){this.$dispatch("show-cart")},goCheck:function(){this.$dispatch("go-check")}}}},20:function(t,e,s){e=t.exports=s(4)(),e.push([t.id,".shopping_cart_bar{height:50px;background:none repeat scroll 0 0 #fff;bottom:0;margin:0;padding:0;position:fixed}.shopping_cart_bar .weui_tabbar_item{text-align:center;line-height:40px}.shopping_cart_bar .bgea8010{color:#fff;background-color:#ea8010}.shopping_cart_bar .bgeb4f38{color:#fff;background-color:#eb4f38}","",{version:3,sources:["/./src/components/shopping-cart.vue"],names:[],mappings:"AAAA,mBAAmB,YAAY,uCAAuC,SAAS,SAAS,UAAU,cAAc,CAAC,qCAAqC,kBAAkB,gBAAgB,CAAC,6BAA6B,WAAW,wBAAwB,CAAC,6BAA6B,WAAW,wBAAwB,CAAC",file:"shopping-cart.vue",sourcesContent:[".shopping_cart_bar{height:50px;background:none repeat scroll 0 0 #FFF;bottom:0;margin:0;padding:0;position:fixed}.shopping_cart_bar .weui_tabbar_item{text-align:center;line-height:40px}.shopping_cart_bar .bgea8010{color:#fff;background-color:#ea8010}.shopping_cart_bar .bgeb4f38{color:#fff;background-color:#eb4f38}\n"],sourceRoot:"webpack://"}])},21:function(t,e,s){var o=s(20);"string"==typeof o&&(o=[[t.id,o,""]]);s(5)(o,{});o.locals&&(t.exports=o.locals)},23:function(t,e){t.exports='<div class=actionsheet_wrap> <div class=weui_mask_transition :class="{\'weui_fade_toggle\': show}" :style="{display: show ? \'block\' : \'none\'}" @click="show=false"></div> <div class=weui_actionsheet :class="{\'weui_actionsheet_toggle\': show}"> <div class=weui_actionsheet_menu> <div class=weui_actionsheet_cell style=background-color:#EEE> <div class=container> <div class=left style=text-align:left;padding-left:20px> <span class="" style="border-left:solid 2px #00f;font-size:15px;padding-left:10px">购物车</span> </div> <div class=right style=text-align:right;padding-right:20px> <button class="button button-small button-action"> <i class="fa fa-trash-o"></i> 清空 </button> </div> </div> </div> <div class=weui_actionsheet_cell v-for="product in selectedProducts"> <div class=container> <div class=left style=width:150px> <span style=font-size:16px>{{product.name}}</span> <span style=font-size:14px;color:red>￥ {{product.price}}</span> </div> <div class=right style=text-align:right;padding-right:20px> <button class="button button-action button-circle button-tiny" @click=minus(product)> <i class="fa fa-minus"></i> </button> {{product.amount}} <button class="button button-action button-circle button-tiny add-product" @click="plus(product, $event)"> <i class="fa fa-plus"></i> </button> </div> </div> </div> <div class=weui_actionsheet_cell style=background-color:#EEE> <div class=container> <div class=left style=text-align:left;padding-left:20px> <span class="" style="border-left:solid 2px red;font-size:15px;padding-left:10px">￥ {{totalPrice}}</span> </div> <div class=right style=text-align:right;padding-right:20px> <button @click=goCheck class="button button-small button-caution"> <i class="fa fa-trash-o"></i> 结算 </button> </div> </div> </div> </div> </div> </div>'},24:function(t,e){t.exports='<div class=weui_tab> <div class="weui_tabbar shopping_cart_bar"> <a class=weui_tabbar_item> <slot name=money>￥ 0</slot> </a> <a class="weui_tabbar_item bgea8010" @click=showCart> <i class="fa fa-shopping-cart"></i> 查看购物车 </a> <a class="weui_tabbar_item bgeb4f38" @click=goCheck> 去结算 </a> </div> <div class=weui_tab_bd></div> </div>'},25:function(t,e,s){var o,i;o=s(18),i=s(23),t.exports=o||{},t.exports.__esModule&&(t.exports=t.exports["default"]),i&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=i)},26:function(t,e,s){var o,i;s(21),o=s(19),i=s(24),t.exports=o||{},t.exports.__esModule&&(t.exports=t.exports["default"]),i&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=i)},49:function(t,e,s){"use strict";function o(t){return t&&t.__esModule?t:{"default":t}}Object.defineProperty(e,"__esModule",{value:!0});var i=s(15),c=o(i),a=s(3),n=o(a),r=s(1),l=o(r);e["default"]={data:function(){return{product:{comments:[]},selectedProducts:[],showCart:!1}},route:{data:function(t){this.$dispatch("show-loading"),this.$http.get("http://jiancan.me/api/u1/products/one.json",{product_id:this.$route.params.product_id}).then(function(t){this.$set("product",t.data),this.loadSelected(),this.$dispatch("hide-loading")},function(t){this.$dispatch("response-msg",t)})}},computed:{totalPrice:function(){for(var t=0,e=0;e<this.selectedProducts.length;e++)t+=this.selectedProducts[e].price*this.selectedProducts[e].amount;return t},buildLink:function(){return"/shops/"+this.product.shop_id}},methods:{saveSelected:function(){localStorage.setItem("jc_"+this.product.shop_id+"_cart",(0,c["default"])(this.selectedProducts))},loadSelected:function(){var t=localStorage.getItem("jc_"+this.product.shop_id+"_cart");null!=t&&(this.selectedProducts=JSON.parse(t))},addProduct:function(t){var e=this.getIndex(t);0>e?this.selectedProducts.push({id:t.id,amount:1,name:t.name,price:t.price}):this.selectedProducts[e].amount++,this.saveSelected()},removeProduct:function(t){var e=this.getIndex(t);e>=0&&(this.selectedProducts[e].amount>1?this.selectedProducts[e].amount--:this.selectedProducts.splice(e,1)),this.saveSelected()},checkSelected:function(t){if(!this.selectedProducts)return 0;for(var e=0;e<this.selectedProducts.length;e++)if(t.id===this.selectedProducts[e].id)return this.selectedProducts[e].amount;return 0},getIndex:function(t){for(var e=0;e<this.selectedProducts.length;e++)if(t.id===this.selectedProducts[e].id)return e;return-1}},events:{minus:function(t){this.removeProduct(t)},plus:function(t){this.addProduct(t)},"show-cart":function(){this.showCart=!this.showCart}},components:{XHeader:l["default"],ShoppingCart:s(26),ShoppingCartList:s(25),Rater:n["default"]}}},102:function(t,e){t.exports='<x-header> {{product.name}} <div slot=right> <i class="fa fa-heart-o"></i> </div> </x-header> <div class=product_header> <img :src=product.avatar /> <div class=product_card> <div class=content> <a class=header>{{product.name}}</a> <div class=meta> </div> <div class=description> <p></p> </div> <div class=extra> <rater :value.sync=data42 slot=value active-color=#04BE02 :font-size=15 disabled=disabled></rater> </div> </div> <div class=buy> <button class="button button-action button-circle button-tiny" @click=removeProduct(product)> <i class="fa fa-minus"></i> </button> <span v-show=checkSelected(product)>{{checkSelected(product)}}</span> <button class="button button-action button-circle button-tiny add-product" @click=addProduct(product)> <i class="fa fa-plus"></i> </button> </div> </div> </div> <div class=weui_panel> <div class=weui_panel_hd>美食评价</div> <div class=weui_panel_bd> <div v-for="comment in product.comments" class="weui_media_box weui_media_text"> <h4 class=weui_media_title>{{comment.user.nickname}}</h4> <p class=weui_media_desc>{{comment.content}}</p> <ul class=weui_media_info> <li class=weui_media_info_meta>文字来源</li> <li class=weui_media_info_meta>{{comment.created_at}}</li> <li class="weui_media_info_meta weui_media_info_meta_extra">其它信息</li> </ul> </div> </div> </div> <shopping-cart-list :show.sync=showCart :selected-products=selectedProducts></shopping-cart-list> <shopping-cart> <span slot=money style=color:#56abe4>￥ {{totalPrice}}</span> </shopping-cart>'},129:function(t,e,s){var o,i;o=s(49),i=s(102),t.exports=o||{},t.exports.__esModule&&(t.exports=t.exports["default"]),i&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=i)}});
//# sourceMappingURL=6.0d3db37935e10f0ca43b.js.map