//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap
//= require 'china_city/jquery.china_city'
//= require nprogress
//= require message-bus
//= require jquery.qrcode.min
//= require bootstrap-notify.min
//= require turbolinks

window.App = {
  current_merchant_id: null,
  access_token: '',
  isLogined: function() {
    return App.current_merchant_id !== null;
  }
};

NProgress.configure({
  speed: 300,
  minimum: 0.03,
  ease: 'ease'
});

$(document).on('page:fetch',   function() { 
  NProgress.start();
});
$(document).on('page:change',  function() {
  NProgress.done();
  alert('1');
  MessageBus.start(); // call once at startup
  // how often do you want the callback to fire in ms
  MessageBus.callbackInterval = 60000;
  MessageBus.subscribe("/notifications_count/" + App.access_token, function(data){
    alert('2');
    // data shipped from server
    var div, link, new_title, span, url;
    span = $(".notification-count span");
    link = $(".notification-count a");
    new_title = document.title.replace(/^\(\d+\) /, '');
    if (data.count > 0) {
      span.show();
      new_title = "(" + data.count + ") " + new_title;

      link.addClass("new");

      $.notify({
        title: "<strong>" + data.title + "</strong> ",
        message: "您有新订单(" + data.content + ")，请赶快处理 <a href=\"" + data.content_path + "\">点击这里</a>"
      },{
        delay: 10000
      });
    } else {
      span.hide();
      link.removeClass("new");
    }
    span.text(data.count);
    document.title = new_title;
  });
});
$(document).on('page:restore', function() { NProgress.remove(); });

