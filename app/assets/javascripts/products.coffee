window.ProductView = Backbone.View.extend
  el: 'body'

  initialize: (opts) ->
    @parentView = opts.parentView
    @initFormValidate()

  initFormValidate: () ->
    $(".content-form form").validate
      rules:
        'product[name]': 'required'
        'product[price]': 'required'
        'product[category_id]': 'required'
      messages:
        'product[name]': '请输入菜色的名称'
        'product[price]': '请输入菜色的价钱'
        'product[category_id]': '请选择分类'
