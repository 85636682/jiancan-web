window.RoomView = Backbone.View.extend
  el: 'body'

  initialize: (opts) ->
    @parentView = opts.parentView
    @initFormValidate()

  initFormValidate: () ->
    $(".content-form form").validate
      rules:
        'room[name]': 'required'
        'room[seat]': 'required'
      messages:
        'room[name]': '请输入台桌的名称'
        'room[seat]': '请输入台桌所容纳的人数'
