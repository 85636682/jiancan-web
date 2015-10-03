window.ShopView = Backbone.View.extend
  el: "body"

  events:
    "change .city-group .city-select": "selectCity"

  initialize: (opts) ->
    @parentView = opts.parentView
    @initFormValidate()

  initFormValidate : () ->
    $(".content-form form").validate
      rules:
        'shop[name]': 'required'
        'shop[mobile]': 'required'
        'shop[address]': 'required'
      messages:
        'shop[name]': '请输入店铺的名称'
        'shop[mobile]': '请输入店铺的电话'
        'shop[address]': '请输入店铺的地址'

  selectCity: (e) ->
    _el = $(e.target)
    selects = $(".city-group").find('.city-select')
    next_selects = selects.slice(selects.index(_el) + 1)
    $("option", next_selects).remove()
    if next_selects.first()[0] and _el.val() and !_el.val().match(/--.*--/)
      $.get "/china_city/#{_el.val()}", (data) ->
        data = data.data if data.data?
        next_selects.first()[0].options.add(new Option("--请选择--", 0))
        for option in data.city_data
          next_selects.first()[0].options.add(new Option(option[0], option[1]))
