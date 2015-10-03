window.CategoryView = Backbone.View.extend
  el: 'body'

  initialize: (opts) ->
    @parentView = opts.parentView
    @initFormValidate()

  initFormValidate : () ->
    $(".content-form form").validate
      rules:
        'category[name]': 'required'
      messages:
        'category[name]': "请输入分类名称"
