window.OrderProductsView = Backbone.View.extend
  el: 'body'

  events:
    "click .productQuantityController a.decrease" : "decreaseProductQuantity"
    "click .productQuantityController a.increase" : "increaseProductQuantity"

  initialize: (opts) ->
    @parentView = opts.parentView

  decreaseProductQuantity : (e) ->
    _el = $(e.target)
    _id = _el.data("id")
    _val = Number($("#products_quantity_#{_id}").val())
    if _val <= 0
      return false
    $("#products_quantity_#{_id}").val(_val - 1)
    $("#products_quantity_#{_id}_show").text(_val - 1)
    if $("#products_quantity_#{_id}").val() <= 0
      $("#products_quantity_#{_id}_check").css("display", "none")
    return false

  increaseProductQuantity : (e) ->
    _el = $(e.target)
    _id = _el.data("id")
    _val = Number($("#products_quantity_#{_id}").val())
    $("#products_quantity_#{_id}").val(_val + 1)
    $("#products_quantity_#{_id}_show").text(_val + 1)
    if $("#products_quantity_#{_id}").val() > 0
      $("#products_quantity_#{_id}_check").css("display", "inline")
    return false
