#= require jquery
#= require jquery.turbolinks.min
#= require jquery_ujs
#= require bootstrap
#= require underscore
#= require backbone
#= require 'china_city/jquery.china_city'
#= require message-bus
#= require jquery.qrcode.min
#= require bootstrap-notify.min
#= require turbolinks

AppView = Backbone.View.extend
  el: 'body'

  initialize: ->
    @initNotificationSubscribe()

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

$(document).on 'page:change', ->
  window._appView = new AppView()