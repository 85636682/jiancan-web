webpackJsonp([2],[,,function(t,d,r){!function(d,r){t.exports=r()}(this,function(){return function(t){function d(e){if(r[e])return r[e].exports;var o=r[e]={exports:{},id:e,loaded:!1};return t[e].call(o.exports,o,o.exports,d),o.loaded=!0,o.exports}var r={};return d.m=t,d.c=r,d.p="",d(0)}([function(t,d,r){t.exports=r(4)},function(t,d){"use strict";Object.defineProperty(d,"__esModule",{value:!0}),d["default"]={props:{leftOptions:{type:Object,"default":function(){return{showBack:!0,backText:"Back",preventGoBack:!1}}},rightOptions:{type:Object,"default":function(){return{showMore:!1}}}},methods:{onClickBack:function(){this.leftOptions.preventGoBack?this.$emit("on-click-back"):history.back()}}}},function(t,d){},function(t,d){t.exports="<div class=x-header> <div class=x-header-left> <a class=x-header-back @click.preventdefault v-show=leftOptions.showBack @click=onClickBack>{{leftOptions.backText}}</a> <slot name=left></slot> </div> <h1 class=x-header-title><slot></slot></h1> <div class=x-header-right> <a class=x-header-more @click.preventdefault @click=\"$emit('on-click-more')\" v-if=rightOptions.showMore></a> <slot name=right></slot> </div> </div>"},function(t,d,r){var e,o;r(2),e=r(1),o=r(3),t.exports=e||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)}])})},,,,,,,,,,,,,,,function(t,d,r){!function(d,r){t.exports=r()}(this,function(){return function(t){function d(e){if(r[e])return r[e].exports;var o=r[e]={exports:{},id:e,loaded:!1};return t[e].call(o.exports,o,o.exports,d),o.loaded=!0,o.exports}var r={};return d.m=t,d.c=r,d.p="",d(0)}([function(t,d,r){t.exports=r(3)},function(t,d){"use strict";Object.defineProperty(d,"__esModule",{value:!0});var r=["-moz-box-","-webkit-box-",""];d["default"]={props:{span:{type:[Number,String]}},methods:{buildWidth:function(t){return"number"==typeof t?1>t?t:t/12:"string"==typeof t?t.replace("px","")/this.bodyWidth:void 0}},computed:{style:function(){var t={},d="horizontal"===this.$parent.orient?"marginLeft":"marginTop";if(t[d]=this.$parent.gutter+"px",this.span)for(var e=0;e<r.length;e++)t[r[e]+"flex"]="0 0 "+100*this.buildWidth(this.span)+"%";return t}},data:function(){return{bodyWidth:document.documentElement.offsetWidth}}}},function(t,d){t.exports="<div class=vux-flexbox-item :style=style> <slot></slot> </div>"},function(t,d,r){var e,o;e=r(1),o=r(2),t.exports=e||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)}])})},function(t,d,r){!function(d,r){t.exports=r()}(this,function(){return function(t){function d(e){if(r[e])return r[e].exports;var o=r[e]={exports:{},id:e,loaded:!1};return t[e].call(o.exports,o,o.exports,d),o.loaded=!0,o.exports}var r={};return d.m=t,d.c=r,d.p="",d(0)}([function(t,d,r){t.exports=r(4)},function(t,d){"use strict";Object.defineProperty(d,"__esModule",{value:!0}),d["default"]={props:{gutter:{type:Number,"default":8},orient:{type:String,"default":"horizontal"}}}},function(t,d){},function(t,d){t.exports="<div class=vux-flexbox :class=\"{'flex-col': orient == 'vertical', 'flex-row': orient == 'horizontal'}\"> <slot></slot> </div>"},function(t,d,r){var e,o;r(2),e=r(1),o=r(3),t.exports=e||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)}])})},,,,,,,,,,function(t,d,r){"use strict";function e(t){return t&&t.__esModule?t:{"default":t}}Object.defineProperty(d,"__esModule",{value:!0});var o=r(109),s=e(o),n=r(108),i=e(n),u=r(111),l=e(u),a=r(107),p=e(a),c=r(112),b=e(c),h=r(110),x=e(h),f=r(118),m=e(f),v=r(117),y=e(v),w=r(119),A=e(w),_=r(116),g=e(_),B=r(120),M=e(B),k=r(115),X=e(k),z=r(113),L=e(z),S=r(114),R=e(S);d["default"]={props:["menu","submenu"],components:{BoyShoe:s["default"],BoyShirt:i["default"],BoyTrousers:l["default"],BoyJacket:p["default"],BoyUnderware:b["default"],BoySuit:x["default"],ChildShoe:L["default"],ChildWear:R["default"],GirlShoe:m["default"],GirlShirt:y["default"],GirlTrousers:A["default"],GirlDress:g["default"],GirlUnderware:M["default"],GirlBra:X["default"]}}},,,,,,,,function(t,d,r){"use strict";function e(t){return t&&t.__esModule?t:{"default":t}}Object.defineProperty(d,"__esModule",{value:!0});var o=r(2),s=e(o),n=r(18),i=e(n),u=r(17),l=e(u),a=r(106),p=e(a);d["default"]={data:function(){return{env:"production",leftOptions:{showBack:!0,backText:"Back",preventGoBack:!0},showed:"girl",showedSubMenu:"shoe",girls:[{name:"女鞋",value:"shoe"},{name:"衬衫",value:"shirt"},{name:"连衣裙",value:"dress"},{name:"裤子",value:"trousers"},{name:"内裤",value:"underware"},{name:"文胸",value:"bra"}],boys:[{name:"男鞋",value:"shoe"},{name:"上衣",value:"jacket"},{name:"衬衫",value:"shirt"},{name:"西装",value:"suit"},{name:"裤子",value:"trousers"},{name:"内裤",value:"underware"}],children:[{name:"童鞋",value:"shoe"},{name:"童装",value:"wear"}]}},route:{data:function(t){}},computed:{girlListWidth:function(){return{width:8*this.girls.length+"rem"}},boyListWidth:function(){return{width:8*this.boys.length+"rem"}},childListWidth:function(){return{width:8*this.children.length+"rem"}}},methods:{selectItem:function(t){this.showedSubMenu=t}},components:{XHeader:s["default"],Flexbox:i["default"],FlexboxItem:l["default"],SizeTable:p["default"]}}},,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,function(t,d){t.exports="<girl-shoe v-if=\"menu == 'girl' && submenu == 'shoe'\"></girl-shoe> <girl-shirt v-if=\"menu == 'girl' && submenu == 'shirt'\"></girl-shirt> <girl-trousers v-if=\"menu == 'girl' && submenu == 'trousers'\"></girl-trousers> <girl-dress v-if=\"menu == 'girl' && submenu == 'dress'\"></girl-dress> <girl-underware v-if=\"menu == 'girl' && submenu == 'underware'\"></girl-underware> <girl-bra v-if=\"menu == 'girl' && submenu == 'bra'\"></girl-bra> <child-shoe v-if=\"menu == 'child' && submenu == 'shoe'\"></child-shoe> <child-wear v-if=\"menu == 'child' && submenu == 'wear'\"></child-wear> <boy-shoe v-if=\"menu == 'boy' && submenu == 'shoe'\"></boy-shoe> <boy-shirt v-if=\"menu == 'boy' && submenu == 'shirt'\"></boy-shirt> <boy-trousers v-if=\"menu == 'boy' && submenu == 'trousers'\"></boy-trousers> <boy-jacket v-if=\"menu == 'boy' && submenu == 'jacket'\"></boy-jacket> <boy-underware v-if=\"menu == 'boy' && submenu == 'underware'\"></boy-underware> <boy-suit v-if=\"menu == 'boy' && submenu == 'suit'\"></boy-suit>"},function(t,d){t.exports="<table class=size-table> <thead> <tr> <th> 上衣<br>尺码 </th> <th> 服装<br>尺码 </th> <th> 中国<br>号型 </th> <th> 胸围<br>/cm </th> <th> 腰围<br>/cm </th> <th> 肩宽<br>/cm </th> <th> 适合<br>身高 </th> </tr> </thead> <tbody> <tr> <td>S</td> <td>46</td> <td>165<br>/80A</td> <td>82-85</td> <td>72-75</td> <td>42</td> <td>163<br>167</td> </tr> <tr> <td>M</td> <td>48</td> <td>170<br>/84A</td> <td>86-89</td> <td>76-79</td> <td>44</td> <td>168<br>172</td> </tr> <tr> <td>L</td> <td>50</td> <td>175<br>/88A</td> <td>90-93</td> <td>80-84</td> <td>46</td> <td>173<br>177</td> </tr> <tr> <td>XL</td> <td>52</td> <td>180<br>/92A</td> <td>94-97</td> <td>85-88</td> <td>48</td> <td>178<br>182</td> </tr> <tr> <td>XXL</td> <td>54</td> <td>185<br>/96A</td> <td>98-102</td> <td>89-92</td> <td>50</td> <td>182<br>187</td> </tr> <tr> <td>XXXL</td> <td>56</td> <td>190<br>/100A</td> <td>103-107</td> <td>93-96</td> <td>52</td> <td>187<br>190</td> </tr> </tbody> </table>"},function(t,d){t.exports="<table class=size-table> <thead> <tr> <th> 衬衫<br>尺码 </th> <th> 上衣<br>尺码 </th> <th> 国际<br>型号 </th> <th> 肩宽<br>/cm </th> <th> 胸围<br>/cm </th> <th> 衣长 </th> <th> 身高 </th> </tr> </thead> <tbody> <tr> <td>XS</td> <td>37</td> <td>160<br>/80A</td> <td>98-101</td> <td>42-43</td> <td>72</td> <td>160</td> </tr> <tr> <td>S</td> <td>38</td> <td>165<br>/84A</td> <td>102-105</td> <td>44-45</td> <td>74</td> <td>165</td> </tr> <tr> <td>M</td> <td>39</td> <td>170<br>/88A</td> <td>106-109</td> <td>46-47</td> <td>76</td> <td>170</td> </tr> <tr> <td>L</td> <td>40</td> <td>175<br>/92A</td> <td>110-103</td> <td>47-48</td> <td>78</td> <td>175</td> </tr> <tr> <td>XL</td> <td>41</td> <td>180<br>/96A</td> <td>114-117</td> <td>49-50</td> <td>80</td> <td>180</td> </tr> <tr> <td>XXL</td> <td>42</td> <td>180<br>/100A</td> <td>118-121</td> <td>51-52</td> <td>82</td> <td>185</td> </tr> <tr> <td>XXXL</td> <td>43</td> <td>185<br>/104A</td> <td>122-125</td> <td>53-54</td> <td>83</td> <td>190</td> </tr> </tbody> </table>"},function(t,d){t.exports="<table class=size-table> <thead> <tr> <th> 脚长cm </th> <th> 欧洲EUR </th> <th> 美国US </th> <th> 英国UK </th> </tr> </thead> <tbody> <tr> <td>24.5</td> <td>39 1/3</td> <td>6.5</td> <td>6</td> </tr> <tr> <td>25</td> <td>40</td> <td>7</td> <td>6.5</td> </tr> <tr> <td>25.5</td> <td>40 2/3</td> <td>7.5</td> <td>7</td> </tr> <tr> <td>26</td> <td>41 2/3</td> <td>8</td> <td>7.5</td> </tr> <tr> <td>26.5</td> <td>42</td> <td>8.5</td> <td>8</td> </tr> <tr> <td>27</td> <td>42 2/3</td> <td>9</td> <td>8.5</td> </tr> <tr> <td>27.5</td> <td>43 1/3</td> <td>9.5</td> <td>9</td> </tr> <tr> <td>28</td> <td>44</td> <td>10</td> <td>9.5</td> </tr> <tr> <td>28.5</td> <td>44 2/3</td> <td>10.5</td> <td>10</td> </tr> <tr> <td>29</td> <td>45 1/3</td> <td>11</td> <td>10.5</td> </tr> <tr> <td>29.5</td> <td>46</td> <td>11.5</td> <td>11</td> </tr> </tbody> </table>"},function(t,d){t.exports="<table class=size-table> <thead> <tr> <th> 尺码 </th> <th> 规格 </th> <th> 版型 </th> <th> 衣长 </th> <th> 胸围 </th> <th> 肩宽 </th> <th> 袖长 </th> </tr> </thead> <tr> <td> 2R48 </td> <td> 165<br>/96C </td> <td> 偏胖 </td> <td> 70 </td> <td> 106 </td> <td> 44.7 </td> <td> 60 </td> </tr> <tr> <td> 2R50 </td> <td> 170<br>/100C </td> <td> 偏胖 </td> <td> 72 </td> <td> 114 </td> <td> 45.9 </td> <td> 61.5 </td> </tr> <tr> <td> 2R52 </td> <td> 175<br>/104C </td> <td> 偏胖 </td> <td> 74 </td> <td> 114 </td> <td> 47.1 </td> <td> 63 </td> </tr> <tr> <td> 2R54 </td> <td> 180<br>/108C </td> <td> 偏胖 </td> <td> 76 </td> <td> 118 </td> <td> 48.3 </td> <td> 64.5 </td> </tr> <tr> <td> 2R56 </td> <td> 185<br>/112C </td> <td> 偏胖 </td> <td> 78 </td> <td> 122 </td> <td> 49.5 </td> <td> 66 </td> </tr> <tr> <td> 4R46 </td> <td> 165<br>/92B </td> <td> 标准 </td> <td> 70 </td> <td> 102 </td> <td> 43.5 </td> <td> 60 </td> </tr> <tr> <td> 4R48 </td> <td> 170<br>/96B </td> <td> 标准 </td> <td> 72 </td> <td> 106 </td> <td> 44.7 </td> <td> 61.5 </td> </tr> <tr> <td> 4R50 </td> <td> 175<br>/100B </td> <td> 标准 </td> <td> 74 </td> <td> 110 </td> <td> 45.9 </td> <td> 63 </td> </tr> <tr> <td> 4R52 </td> <td> 180<br>/104B </td> <td> 标准 </td> <td> 76 </td> <td> 114 </td> <td> 47.1 </td> <td> 64.5 </td> </tr> <tr> <td> 4R54 </td> <td> 185<br>/108B </td> <td> 标准 </td> <td> 78 </td> <td> 118 </td> <td> 48.3 </td> <td> 66 </td> </tr> <tr> <td> 6R44 </td> <td> 165<br>/88A </td> <td> 偏瘦 </td> <td> 70 </td> <td> 98 </td> <td> 42.3 </td> <td> 60 </td> </tr> <tr> <td> 6R46 </td> <td> 170<br>/92A </td> <td> 偏瘦 </td> <td> 72 </td> <td> 102 </td> <td> 43.5 </td> <td> 61.5 </td> </tr> <tr> <td> 6R48 </td> <td> 175<br>/96A </td> <td> 偏瘦 </td> <td> 74 </td> <td> 106 </td> <td> 44.7 </td> <td> 63 </td> </tr> <tr> <td> 6R50 </td> <td> 180<br>/100C </td> <td> 偏瘦 </td> <td> 76 </td> <td> 110 </td> <td> 45.9 </td> <td> 64.5 </td> </tr> <tr> <td> 6R52 </td> <td> 185<br>/104C </td> <td> 偏瘦 </td> <td> 76 </td> <td> 114 </td> <td> 47.1 </td> <td> 66 </td> </tr> <tbody> </tbody> </table>"},function(t,d){t.exports="<table class=size-table> <thead> <tr> <th colspan=2> 男库<br>尺码 </th> <th> 尺码/英寸 </th> <th> 臀围<br>/cm </th> <th> 腰围<br>/cm </th> <th> 腰围<br>/市尺 </th> </tr> </thead> <tbody> <tr> <td rowspan=2>S</td> <td>170/72A</td> <td>29</td> <td>97.5</td> <td>73.7</td> <td>2尺2寸</td> </tr> <tr> <td>170/74A</td> <td>30</td> <td>100</td> <td>76.2</td> <td>2尺3寸</td> </tr> <tr> <td rowspan=2>M</td> <td>170/76A</td> <td>31</td> <td>102.5</td> <td>78.7</td> <td>2尺4寸</td> </tr> <tr> <td>175/80A</td> <td>32</td> <td>105</td> <td>81.3</td> <td>2尺4寸</td> </tr> <tr> <td rowspan=2>L</td> <td>175/82A</td> <td>33</td> <td>107.5</td> <td>83.8</td> <td>2尺5寸</td> </tr> <tr> <td>175/84A</td> <td>34</td> <td>110</td> <td>86.4</td> <td>2尺6寸</td> </tr> <tr> <td rowspan=2>XL</td> <td>180/86A</td> <td>35</td> <td>112.5</td> <td>89</td> <td>2尺6寸</td> </tr> <tr> <td>180/90A</td> <td>36</td> <td>100</td> <td>91.4</td> <td>2尺7寸</td> </tr> <tr> <td rowspan=2>XXL</td> <td>185/92A</td> <td>37</td> <td>117.5</td> <td>93.3</td> <td>2尺8寸</td> </tr> <tr> <td>185/94B</td> <td>38</td> <td>120</td> <td>96.5</td> <td>2尺9寸</td> </tr> <tr> <td rowspan=2>XXXL</td> <td>190/98B</td> <td>40</td> <td>122.5</td> <td>101.6</td> <td>3尺1寸</td> </tr> <tr> <td>195/102B</td> <td>42</td> <td>130</td> <td>106.6</td> <td>3尺2寸</td> </tr> </tbody> </table>"},function(t,d){t.exports="<table class=size-table> <thead> <tr> <th> 尺码 </th> <th> 腰围 </th> <th> 腰围(市尺) </th> <th> </th> <th> 身高 </th> </tr> </thead> <tbody> <tr> <td>M</td> <td>62-70</td> <td>2.0-2.2</td> <td>82-90</td> <td>160-170</td> </tr> <tr> <td>L</td> <td>66-74</td> <td>2.2-2.4</td> <td>86-94</td> <td>165-175</td> </tr> <tr> <td>XL</td> <td>72-82</td> <td>2.4-2.5</td> <td>88-96</td> <td>170-180</td> </tr> <tr> <td>XXL</td> <td>76-84</td> <td>>2.6</td> <td>94-102</td> <td>175-185</td> </tr> </tbody> </table>"},function(t,d){t.exports="<table class=size-table> <thead> <tr> <th> 年龄<br>(周岁) </th> <th> 脚长<br>(女/男) </th> <th> 鞋内长<br>(女/男) </th> <th> 中国码<br>(女/男) </th> </tr> </thead> <tbody> <tr> <td> 1岁 </td> <td> 12cm<br>12cm </td> <td> 13cm<br>13.5cm </td> <td> 16码<br>17码 </td> </tr> <tr> <td> 2岁 </td> <td> 13.5cm<br>14cm </td> <td> 14.5cm<br>15cm </td> <td> 19码<br>20码 </td> </tr> <tr> <td> 2.5岁 </td> <td> 14cm<br>14.5cm </td> <td> 15cm<br>15.5cm </td> <td> 20码<br>21码 </td> </tr> <tr> <td> 3岁 </td> <td> 15cm<br>15.5cm </td> <td> 16cm<br>16.5cm </td> <td> 22码<br>23码 </td> </tr> <tr> <td> 3.5岁 </td> <td> 15.5cm<br>16cm </td> <td> 16.5cm<br>17cm </td> <td> 23码<br>24码 </td> </tr> <tr> <td> 4岁 </td> <td> 16cm<br>16.5cm </td> <td> 17cm<br>17.5cm </td> <td> 24码<br>25码 </td> </tr> <tr> <td> 4.5岁 </td> <td> 16.5cm<br>17cm </td> <td> 17.5cm<br>18cm </td> <td> 25码<br>26码 </td> </tr> <tr> <td> 5.5岁 </td> <td> 17.5cm<br>18cm </td> <td> 18.5cm<br>19cm </td> <td> 27码<br>28码 </td> </tr> <tr> <td> 6.5岁 </td> <td> 18.5cm<br>19cm </td> <td> 19.5cm<br>20cm </td> <td> 29码<br>30码 </td> </tr> <tr> <td> 7岁 </td> <td> 19.5cm<br>20cm </td> <td> 20.5cm<br>21cm </td> <td> 31码<br>32码 </td> </tr> <tr> <td> 8岁 </td> <td> 20cm<br>21cm </td> <td> 21cm<br>22cm </td> <td> 32码<br>34码 </td> </tr> <tr> <td> 9岁 </td> <td> 20.5cm<br>男孩个体较大 </td> <td> 21.5cm<br>± </td> <td> 33码<br>35码 </td> </tr> <tr> <td> 10岁 </td> <td> 21cm<br>男孩个体较大 </td> <td> 22cm<br>± </td> <td> 34码<br>36码 </td> </tr> <tr> <td> 11岁 </td> <td> 21.5cm<br>男孩个体较大 </td> <td> 22.5cm<br>± </td> <td> 35码<br>37码 </td> </tr><tr> <td> 12岁 </td> <td> 14cm<br>14.5cm </td> <td> 23cm<br>± </td> <td> 36码<br>38-40码 </td> </tr></tbody> </table>"},function(t,d){t.exports="<table class=size-table> <thead> <tr> <th> 年龄 </th> <th> 尺码 </th> <th> 腰围 </th> <th> 胸围 </th> <th> 身高 </th> </tr> </thead> <tbody> <tr> <td> 0-3个月 </td> <td> 59 </td> <td> 59 </td> <td> 50 </td> <td> 38 </td> </tr> <tr> <td> 3-6个月 </td> <td> 66 </td> <td> 66 </td> <td> 53 </td> <td> 40 </td> </tr> <tr> <td> 6-9个月 </td> <td> 73 </td> <td> 73 </td> <td> 56 </td> <td> 42 </td> </tr> <tr> <td> 9-12个月 </td> <td> 80 </td> <td> 80 </td> <td> 59 </td> <td> 44 </td> </tr> <tr> <td> 1-1.5岁 </td> <td> 90 </td> <td> 90 </td> <td> 62 </td> <td> 46 </td> </tr> <tr> <td> 1.5岁-3岁 </td> <td> 100 </td> <td> 100 </td> <td> 54 </td> <td> 52 </td> </tr> <tr> <td> 3岁-6岁 </td> <td> 110 </td> <td> 110 </td> <td> 58 </td> <td> 54 </td> </tr> <tr> <td> 6岁-8岁 </td> <td> 120 </td> <td> 120 </td> <td> 64 </td> <td> 56 </td> </tr> <tr> <td> 8岁-10岁 </td> <td> 130 </td> <td> 130 </td> <td> 65 </td> <td> 58 </td> </tr> <tr> <td> 10岁-11岁 </td> <td> 140 </td> <td> 140 </td> <td> 68 </td> <td> 60 </td> </tr> <tr> <td> 12岁-13岁 </td> <td> 150 </td> <td> 150 </td> <td> 72 </td> <td> 62 </td> </tr> </tbody> </table>"},function(t,d){t.exports="<table class=size-table> <thead> <tr> <th> 下胸围<br>/cm </th> <th> 上胸围<br>/cm </th> <th> 国际尺码 </th> </tr> </thead> <tbody> <tr> <td rowspan=4>68-72</td> <td>80</td> <td>32/70A</td> </tr> <tr> <td>83</td> <td>32/70B</td> </tr> <tr> <td>85</td> <td>32/70C</td> </tr> <tr> <td>88</td> <td>32/70D</td> </tr> <tr> <td rowspan=5>73-77</td> <td>85</td> <td>34/75A</td> </tr> <tr> <td>88</td> <td>34/75B</td> </tr> <tr> <td>90</td> <td>34/75C</td> </tr> <tr> <td>95</td> <td>34/75D</td> </tr> <tr> <td>98</td> <td>34/75E</td> </tr> <tr> <td rowspan=5>78-82</td> <td>90</td> <td>36/80A</td> </tr> <tr> <td>93</td> <td>36/80B</td> </tr> <tr> <td>95</td> <td>36/80C</td> </tr> <tr> <td>98</td> <td>36/80D</td> </tr> <tr> <td>103</td> <td>36/80E</td> </tr> <tr> <td rowspan=4>83-87</td> <td>95-97</td> <td>38/85A</td> </tr> <tr> <td>99-101</td> <td>38/85B</td> </tr> <tr> <td>101-103</td> <td>38/85C</td> </tr> <tr> <td>103-105</td> <td>38/85D</td> </tr> <tr> <td rowspan=4>88-92</td> <td>103</td> <td>40/90B</td> </tr> <tr> <td>105</td> <td>40/90C</td> </tr> <tr> <td>108</td> <td>40/90D</td> </tr> <tr> <td>113</td> <td>40/90E</td> </tr> </tbody> </table>"},function(t,d){t.exports="<table class=size-table> <thead> <tr> <th> 裙子<br>尺码 </th> <th> 服装<br>尺码 </th> <th> 胸围<br>/cm </th> <th> 腰围<br>/cm </th> <th> 肩宽<br>/cm </th> <th> 身高/<br>胸围 </th> </tr> </thead> <tbody> <tr> <td>S</td> <td>36</td> <td>79-82</td> <td>62-66</td> <td>37</td> <td>155/82A</td> </tr> <tr> <td>M</td> <td>38</td> <td>83-86</td> <td>67-70</td> <td>38</td> <td>160/86A</td> </tr> <tr> <td>L</td> <td>40</td> <td>87-90</td> <td>71-74</td> <td>39</td> <td>165/90A</td> </tr> <tr> <td>XL</td> <td>42</td> <td>91-94</td> <td>75-78</td> <td>40</td> <td>170/94A</td> </tr> <tr> <td>XXL</td> <td>44</td> <td>95-98</td> <td>79-82</td> <td>41</td> <td>172/98A</td> </tr> </tbody> </table>"},function(t,d){t.exports="<table class=size-table> <thead> <tr> <th> 衬衫<br>尺码 </th> <th> 国际<br>尺码 </th> <th> 胸围<br>/cm </th> <th> 腰围<br>/cm </th> <th> 肩宽<br>/cm </th> <th> 身高<br>/胸围 </th> </tr> </thead> <tbody> <tr> <td>S</td> <td>36</td> <td>79-82</td> <td>62-66</td> <td>37</td> <td>155/82A</td> </tr> <tr> <td>M</td> <td>37</td> <td>83-86</td> <td>67-70</td> <td>38</td> <td>160/86A</td> </tr> <tr> <td>L</td> <td>38</td> <td>87-90</td> <td>71-74</td> <td>39</td> <td>165/90A</td> </tr> <tr> <td>XL</td> <td>39</td> <td>91-94</td> <td>75-78</td> <td>40</td> <td>170/94A</td> </tr> <tr> <td>XXL</td> <td>40</td> <td>95-98</td> <td>79-82</td> <td>41</td> <td>172/98A</td> </tr> <tr> <td>XXXL</td> <td>41</td> <td>99-103</td> <td>83-86</td> <td>42</td> <td>175/102A</td> </tr> </tbody> </table>"},function(t,d){t.exports="<table class=size-table> <thead> <tr> <th> 脚长cm </th> <th> 欧洲EUR </th> <th> 美国US </th> <th> 英国UK </th> </tr> </thead> <tbody> <tr> <td>22.5</td> <td>36 2/3</td> <td>5.5</td> <td>4.5</td> </tr> <tr> <td>23</td> <td>37 1/3</td> <td>6</td> <td>5</td> </tr> <tr> <td>23.5</td> <td>38</td> <td>6.5</td> <td>5.5</td> </tr> <tr> <td>24</td> <td>38 2/3</td> <td>7</td> <td>6</td> </tr> <tr> <td>24.5</td> <td>39 1/3</td> <td>7.5</td> <td>6.5</td> </tr> <tr> <td>25</td> <td>40</td> <td>8</td> <td>7</td> </tr> <tr> <td>25.5</td> <td>40</td> <td>8</td> <td>7</td> </tr> <tr> <td>25.5</td> <td>40 2/3</td> <td>8.5</td> <td>7.5</td> </tr> <tr> <td>26</td> <td>41 1/3</td> <td>9</td> <td>8</td> </tr> </tbody> </table>"},function(t,d){t.exports="<table class=size-table> <thead> <tr> <th> 女裤 </th> <th> 裤子尺码<br>/英寸 </th> <th> 国标号型 </th> <th> 对应臀围<br>/cm </th> <th> 对应腰围<br>/cm </th> </tr> </thead> <tbody> <tr> <td rowspan=2>S</td> <td>25</td> <td>155/62A</td> <td>85</td> <td>62</td> </tr> <tr> <td>26</td> <td>159/64A</td> <td>87.5</td> <td>64.5</td> </tr> <tr> <td rowspan=2>M</td> <td>27</td> <td>160/66A</td> <td>90</td> <td>67</td> </tr> <tr> <td>28</td> <td>164/68A</td> <td>92.5</td> <td>69.5</td> </tr> <tr> <td rowspan=2>L</td> <td>29</td> <td>165/70A</td> <td>95</td> <td>72</td> </tr> <tr> <td>30</td> <td>169/72A</td> <td>97.5</td> <td>74.5</td> </tr> <tr> <td rowspan=2>XL</td> <td>31</td> <td>170/74A</td> <td>100</td> <td>77</td> </tr> <tr> <td>32</td> <td>170/76A</td> <td>102.5</td> <td>79.5</td> </tr> </tbody> </table>"},function(t,d){t.exports="<table class=size-table> <thead> <tr> <th> 尺码 </th> <th> 腰围 </th> <th> 腰围(市尺) </th> <th> 臀围 </th> </tr> </thead> <tbody> <tr> <td>S</td> <td>55-61</td> <td>1.8-1.9</td> <td>80-86</td> </tr> <tr> <td>M</td> <td>61-67</td> <td>1.9-2.1</td> <td>85-93</td> </tr> <tr> <td>L</td> <td>67-73</td> <td>2.1-2.2</td> <td>90-98</td> </tr> <tr> <td>XL</td> <td>73-79</td> <td>2.2-2.3</td> <td>95-103</td> </tr> </tbody> </table>"},,,,,,,,function(t,d){t.exports='<x-header v-if="env !== \'production\'"> 尺码对照表 </x-header> <flexbox style=margin-top:30px> <flexbox-item style=text-align:center> <button @click="showed = \'girl\'" :class="{ \'sizeButtonActive\': showed == \'girl\'}" class="sizeButton button button-rounded"> 女装 </button> </flexbox-item> <flexbox-item style=text-align:center> <button @click="showed = \'boy\'" :class="{ \'sizeButtonActive\': showed == \'boy\'}" class="sizeButton button button-rounded"> 男装 </button> </flexbox-item> <flexbox-item style=text-align:center> <button @click="showed = \'child\'" :class="{ \'sizeButtonActive\': showed == \'child\'}" class="sizeButton button button-rounded"> 童装 </button> </flexbox-item> </flexbox> <div class=sub-menus v-if="showed === \'girl\'"> <div class=sub-menus-list> <ul :style=girlListWidth> <li v-for="girl in girls"> <button @click=selectItem(girl.value) :class="{ \'sizeButtonActive\': showedSubMenu == girl.value }" class="button button-small sizeButton button-rounded"> {{girl.name}} </button> </li> </ul> </div> </div> <div class=sub-menus v-if="showed === \'boy\'"> <div class=sub-menus-list> <ul :style=boyListWidth> <li v-for="boy in boys"> <button @click=selectItem(boy.value) :class="{ \'sizeButtonActive\': showedSubMenu == boy.value }" class="button button-small sizeButton button-rounded"> {{boy.name}} </button> </li> </ul> </div> </div> <div class=sub-menus v-if="showed === \'child\'"> <div class=sub-menus-list> <ul :style=childListWidth> <li v-for="child in children"> <button @click=selectItem(child.value) :class="{ \'sizeButtonActive\': showedSubMenu == child.value }" class="button button-small sizeButton button-rounded"> {{child.name}} </button> </li> </ul> </div> </div> <size-table :menu=showed :submenu=showedSubMenu></size-table>'},,,,function(t,d,r){var e,o;e=r(28),o=r(80),t.exports=e||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)},function(t,d,r){var e,o;o=r(81),t.exports=e||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)},function(t,d,r){var e,o;o=r(82),t.exports=e||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)},function(t,d,r){var e,o;o=r(83),t.exports=e||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)},function(t,d,r){var e,o;o=r(84),t.exports=e||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)},function(t,d,r){var e,o;o=r(85),t.exports=e||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)},function(t,d,r){var e,o;o=r(86),t.exports=e||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)},function(t,d,r){var e,o;o=r(87),t.exports=e||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)},function(t,d,r){var e,o;o=r(88),t.exports=e||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)},function(t,d,r){var e,o;o=r(89),t.exports=e||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)},function(t,d,r){var e,o;o=r(90),t.exports=e||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)},function(t,d,r){var e,o;o=r(91),t.exports=e||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)},function(t,d,r){var e,o;o=r(92),t.exports=e||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)},function(t,d,r){var e,o;o=r(93),t.exports=e||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)},function(t,d,r){var e,o;o=r(94),t.exports=e||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)},,,,,,,function(t,d,r){var e,o;e=r(36),o=r(102),t.exports=e||{},t.exports.__esModule&&(t.exports=t.exports["default"]),o&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=o)}]);
//# sourceMappingURL=2.365ac041a109dbec95d4.js.map