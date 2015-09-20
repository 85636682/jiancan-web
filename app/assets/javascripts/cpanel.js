//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap
//= require 'china_city/jquery.china_city'
//= require nprogress
//= require message-bus
//= require jquery.qrcode.min
//= require pnotify.custom.min
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

$(document).on('page:fetch',   function() { NProgress.start(); });
$(document).on('page:change',  function() { 
  NProgress.done();

  MessageBus.start(); // call once at startup
  // how often do you want the callback to fire in ms
  MessageBus.callbackInterval = 500;
  MessageBus.subscribe("/notifications_count/#{App.access_token}", function(data){
    // data shipped from server
    var div, link, new_title, span, url;
    span = $(".notification-count span");
    link = $(".notification-count a");
    new_title = document.title.replace(/^\(\d+\) /, '');
    if (data.count > 0) {
      span.show();
      new_title = "(" + data.count + ") " + new_title;

      link.addClass("new");

      $(function(){
        new PNotify({
            title: data.title,
            text: data.content
        });
      });
    } else {
      span.hide();
      link.removeClass("new");
    }
    span.text(data.count);
    return document.title = new_title;
  });
});
$(document).on('page:restore', function() { NProgress.remove(); });

