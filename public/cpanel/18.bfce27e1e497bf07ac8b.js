webpackJsonp([18],{1:function(e,s){"use strict";Object.defineProperty(s,"__esModule",{value:!0}),s["default"]={methods:{GoBack:function(){this.$route.router.go(window.history.back())}}}},2:function(e,s){e.exports='<div class="navbar navbar-light bg-faded navigation"> <a class="nav-link btn btn-primary-outline btn-sm" @click=GoBack> <i class="fa fa-arrow-left"></i> 返回 </a> <slot name=title></slot> <slot name=right-content></slot> </div>'},3:function(e,s,a){var t,l;t=a(1),l=a(2),e.exports=t||{},e.exports.__esModule&&(e.exports=e.exports["default"]),l&&(("function"==typeof e.exports?e.exports.options||(e.exports.options={}):e.exports).template=l)},61:function(e,s,a){"use strict";Object.defineProperty(s,"__esModule",{value:!0}),s["default"]={data:function(){return{user_card:{}}},route:{data:function(e){var s=this.$route.params;this.$http.get("http://jiancan.me/api/m1/user_cards/one.json",{access_token:localStorage.token,user_card_id:s.card_id}).then(function(s){e.next({user_card:s.data})},function(e){this.$dispatch("response-msg",e)})}},methods:{inputFileClick:function(e){return this.$els.avatar.click()},uploadAvatar:function(e){if(e.preventDefault(),""!==this.$els.avatar.value){var s=new FormData;s.append("access_token",localStorage.token),s.append("user_card_id",this.$route.params.card_id),s.append("user_card[logo]",this.$els.avatar.files[0]),this.$http.put("http://jiancan.me/api/m1/user_cards/one.json",s).then(function(e){this.$set("user_card",e.data.user_card)},function(e){this.$dispatch("response-msg",e)})}},update:function(e){e.preventDefault();var s=new FormData;s.append("access_token",localStorage.token),s.append("user_card_id",this.$route.params.card_id),s.append("user_card[title]",this.user_card.title),s.append("user_card[prerogative]",this.user_card.prerogative),s.append("user_card[description]",this.user_card.description),s.append("user_card[notice]",this.user_card.notice),this.$http.put("http://jiancan.me/api/m1/user_cards/one.json",s).then(function(e){this.$set("user_card",e.data.user_card)},function(e){this.$dispatch("response-msg",e)})},updateRules:function(e){e.preventDefault();var s=new FormData;s.append("access_token",localStorage.token),s.append("user_card_id",this.$route.params.card_id),s.append("user_card[title]",this.user_card.title),s.append("user_card[prerogative]",this.user_card.prerogative),s.append("user_card[description]",this.user_card.description),s.append("user_card[notice]",this.user_card.notice),s.append("user_card[bonus_rules]",this.user_card.bonus_rules),s.append("user_card[bonus_cleared]",this.user_card.bonus_cleared),s.append("user_card[balance_rules]",this.user_card.balance_rules),s.append("user_card[cost_money_unit]",this.user_card.cost_money_unit),s.append("user_card[increase_bonus]",this.user_card.increase_bonus),s.append("user_card[max_increase_bonus]",this.user_card.max_increase_bonus),s.append("user_card[init_increase_bonus]",this.user_card.init_increase_bonus),s.append("user_card[cost_bonus_unit]",this.user_card.cost_bonus_unit),s.append("user_card[reduce_money]",this.user_card.reduce_money),s.append("user_card[least_money_to_use_bonus]",this.user_card.least_money_to_use_bonus),s.append("user_card[max_reduce_bonus]",this.user_card.max_reduce_bonus),s.append("user_card[discount]",this.user_card.discount),this.$http.put("http://jiancan.me/api/m1/user_cards/one.json",s).then(function(e){this.$set("user_card",e.data.user_card)},function(e){this.$dispatch("response-msg",e)})},pushToWeixin:function(e){e.preventDefault(),this.$http.get("http://jiancan.me/api/m1/user_cards/push.json",{access_token:localStorage.token,user_card_id:this.$route.params.card_id}).then(function(e){alert("同步成功！")},function(e){this.$dispatch("response-msg",e)})}},components:{"nav-bar":a(3)}}},91:function(e,s){e.exports='<nav-bar> <span slot=title class=title>会员卡管理 - {{user_card.title}}</span> <a slot=right-content @click=pushToWeixin class="nav-link btn btn-danger btn-sm pull-xs-right">同步到微信</a> </nav-bar> <table class=table> <thead> <tr> <td colspan=2> 卡券基本信息 </td> </tr> </thead> <tbody> <tr> <td style=width:200px;padding-left:50px> <img @click=inputFileClick alt=会员卡Logo class=img-circle width=100 height=100 v-bind:src=user_card.logo /> <input @change=uploadAvatar v-el:avatar class=avatar type=file accept=image/* style=display:none /> </td> <td> <div class=content-form> <form @submit=update> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">卡券名</label> <div class=col-sm-10> <input class=form-control placeholder=卡券名 type=text v-model=user_card.title /> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">特权说明</label> <div class=col-sm-10> <input class=form-control placeholder=特权说明 type=text v-model=user_card.prerogative /> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">使用说明</label> <div class=col-sm-10> <input class=form-control placeholder=使用说明 type=text v-model=user_card.description /> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">使用提醒</label> <div class=col-sm-10> <input class=form-control placeholder=使用提醒 type=text v-model=user_card.notice /> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">服务电话</label> <div class=col-sm-10> <input class=form-control placeholder=服务电话 type=text v-model=user_card.service_phone /> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label"></label> <div class=col-sm-10> <input type=submit name=commit value="保 存" class="btn btn-primary"/> </div> </div> </form> </div> </td> </tr> </tbody> </table> <form @submit=updateRules> <table class=table> <thead> <tr> <td colspan=2> 卡券金融信息 </td> </tr> </thead> <tbody> <tr> <td colspan=2> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">消费金额</label> <div class=col-sm-4> <input class=form-control placeholder=消费金额 type=text v-model=user_card.cost_money_unit /> <small class=text-muted>以分为单位</small> </div> <label for=inputEmail3 class="col-sm-2 form-control-label">增加积分</label> <div class=col-sm-4> <input class=form-control placeholder=增加积分 type=text v-model=user_card.increase_bonus /> <small class=text-muted>对应增加的积分</small> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">积分上限</label> <div class=col-sm-4> <input class=form-control placeholder=积分上限 type=text v-model=user_card.max_increase_bonus /> <small class=text-muted>用户单次可获取的积分上限</small> </div> <label for=inputEmail3 class="col-sm-2 form-control-label">初始积分</label> <div class=col-sm-4> <input class=form-control placeholder=初始积分 type=text v-model=user_card.init_increase_bonus /> <small class=text-muted>初始设置积分</small> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">最低使用</label> <div class=col-sm-4> <input class=form-control placeholder=最低使用 type=text v-model=user_card.cost_bonus_unit /> <small class=text-muted>每次最低使用积分</small> </div> <label for=inputEmail3 class="col-sm-2 form-control-label">抵扣金额</label> <div class=col-sm-4> <input class=form-control placeholder=抵扣金额 type=text v-model=user_card.reduce_money /> <small class=text-muted>抵扣xx元，（这里以分为单位）</small> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">抵扣条件</label> <div class=col-sm-4> <input class=form-control placeholder=抵扣条件 type=text v-model=user_card.least_money_to_use_bonus /> <small class=text-muted>满xx元（这里以分为单位）可用。</small> </div> <label for=inputEmail3 class="col-sm-2 form-control-label">单笔最多</label> <div class=col-sm-4> <input class=form-control placeholder=单笔最多 type=text v-model=user_card.max_reduce_bonus /> <small class=text-muted>单笔最多使用xx积分。</small> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">享受折扣</label> <div class=col-sm-4> <input class=form-control placeholder=享受折扣 type=text v-model=user_card.discount /> <small class=text-muted>该卡享受的折扣优惠,填10就是九折。</small> </div> <label for=inputEmail3 class="col-sm-2 form-control-label">储值说明</label> <div class=col-sm-4> <input class=form-control placeholder=储值说明 type=text v-model=user_card.balance_rules /> <small class=text-muted>该卡储值功能说明</small> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label">积分规则</label> <div class=col-sm-4> <input class=form-control placeholder=积分规则 type=text v-model=user_card.bonus_rules /> <small class=text-muted>该卡积分规则</small> </div> <label for=inputEmail3 class="col-sm-2 form-control-label">积分清零规则</label> <div class=col-sm-4> <input class=form-control placeholder=清零规则 type=text v-model=user_card.bonus_cleared /> <small class=text-muted>积分清零规则</small> </div> </div> <div class="form-group row"> <label for=inputEmail3 class="col-sm-2 form-control-label"></label> <div class=col-sm-10> <input type=submit name=commit value="保 存" class="btn btn-primary"/> </div> </div> </td> </tr> </tbody> </table> </form> <table class=table> <tr> <td colspan=4> 拥有此卡的用户 </td> </tr> <tr v-for="user_card_user in user_card.user_card_users"> <td> {{user_card_user.user.nickname}} </td> </tr> </table>'},117:function(e,s,a){var t,l;t=a(61),l=a(91),e.exports=t||{},e.exports.__esModule&&(e.exports=e.exports["default"]),l&&(("function"==typeof e.exports?e.exports.options||(e.exports.options={}):e.exports).template=l)}});
//# sourceMappingURL=18.bfce27e1e497bf07ac8b.js.map