//= require jquery
//= require jquery_ujs
//= require jquery.easings.min
//= require jquery.slimscroll.min
//= require jquery.fullpage

$(document).ready(function() {
    $('#fullpage').fullpage({
      anchors: ['firstPage', 'secondPage', '3rdPage', '4thpage', 'lastPage'],
      menu: '#menu',
      css3: true,
      scrollingSpeed: 1000
    });
});
