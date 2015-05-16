// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.ui.accordion
//= require jquery.ui.datepicker
//= require common
//= require lazybox
//= require posts
//= require fancybox
//= require jquery_ujs
//= require owl.carousel
//= require turbolinks
//= require_tree .

$.rails.allowAction = $.lazybox.confirm;

$(document).on('page:fetch', function() {
  return $.lazybox("<i class='icon-orange'></i>", {
    klass: 'spinner',
    close: false,
    esc: false
  });
});

$(document).ready(function() {
	$(".owl-carousel").owlCarousel({
		autoPlay: 3000, //Set AutoPlay to 3 seconds 
    items : 2,
    itemsDesktop : [1199,3],
    itemsDesktopSmall : [979,3],

    //Auto height
    autoHeight : false
	});
});
