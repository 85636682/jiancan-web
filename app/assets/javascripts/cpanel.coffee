#= require jquery
#= require jquery_ujs
#= require jquery.turbolinks.min
#= require bootstrap
#= require underscore
#= require backbone
#= require message-bus
#= require jquery.validate
#= require jquery.qrcode.min
#= require bootstrap-notify.min
#= require turbolinks
#= require shops
#= require categories
#= require workers
#= require products
#= require order_products
#= require rooms
#= require_self

AppView = Backbone.View.extend
  el: 'body'

  initialize: ->
    if $('body').data('controller-name') in ['shops']
      window._shopView = new ShopView({parentView: @})
    if $('body').data('controller-name') in ['categories']
      window._categoryView = new CategoryView({parentView: @})
    if $('body').data('controller-name') in ['workers']
      window._workerView = new WorkerView({parentView: @})
    if $('body').data('controller-name') in ['products']
      window._productView = new ProductView({parentView: @})
    if $('body').data('controller-name') in ['rooms']
      window._roomView = new RoomView({parentView: @})
    if $('body').data('controller-name') in ['order_products']
      window._orderProductsView = new OrderProductsView({parentView: @})

window.App =
  current_merchant_id: null,
  access_token: '',
  isLogined : ->
    App.current_merchant_id != null

$(document).on 'ready', ->
  if App.access_token? App.access_token.length >= 5
    MessageBus.start()
    MessageBus.callbackInterval = 1000
    MessageBus.subscribe "/notifications_count/#{App.access_token}", (data) ->
      span = $(".notification-count span")
      link = $(".notification-count a")
      new_title = document.title.replace(/^\(\d+\) /, '')
      if data.count > 0
        span.show()
        new_title = "(#{data.count}) #{new_title}"
        link.addClass("new")
        $.notify({
          title: "<strong>#{data.title}</strong> ",
          message: "您有新订单(#{data.content})，请赶快处理 <a href=\"#{data.content_path}\">点击这里</a>"
        },{
          delay: 10000
        })
        $("#newOrderRing").get(0).play()
      else
        span.hide()
        link.removeClass("new")
      span.text(data.count)
      document.title = new_title

$(document).on 'page:change', ->
  window._appView = new AppView()
