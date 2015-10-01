#= require jquery
#= require jquery_ujs
#= require jquery.turbolinks.min
#= require bootstrap
#= require underscore
#= require backbone
#= require message-bus
#= require jquery.qrcode.min
#= require bootstrap-notify.min
#= require turbolinks
#= require shops
#= require_self

AppView = Backbone.View.extend
  el: 'body'

  initialize: ->
    @initNotificationSubscribe()

    if $('body').data('controller-name') in ['shops']
      window._shopView = new ShopView({parentView: @})

  initNotificationSubscribe : () ->
    return if not App.access_token?
    return if App.access_token.length < 5
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
      else
        span.hide()
        link.removeClass("new")
      span.text(data.count)
      document.title = new_title
    true

window.App =
  current_merchant_id: null,
  access_token: '',
  isLogined : ->
    App.current_merchant_id != null

$(document).on 'ready', ->
  window._appView = new AppView()
