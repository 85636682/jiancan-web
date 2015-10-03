window.WorkerView = Backbone.View.extend
  el: 'body'

  initialize: (opts) ->
    @parentView = opts.parentView
    @initFormValidate()

  initFormValidate: () ->
    $(".content-form form").validate
      rules:
        'worker[name]': 'required'
        'worker[imei]': 'required'
      messages:
        'worker[name]': '请输入员工的名字'
        'worker[imei]': '请输入员工手机的IMEI码'
