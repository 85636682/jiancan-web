//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap
//= require 'china_city/jquery.china_city'
//= require nprogress
//= require jquery.qrcode.min
//= require turbolinks

NProgress.configure({
  speed: 300,
  minimum: 0.03,
  ease: 'ease'
});

$(document).on('page:fetch',   function() { NProgress.start(); });
$(document).on('page:change',  function() { NProgress.done(); });
$(document).on('page:restore', function() { NProgress.remove(); });