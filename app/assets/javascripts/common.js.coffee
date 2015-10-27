$(document).ready ->
  $(".owl-carousel").owlCarousel
    autoPlay: 3000 #Set AutoPlay to 3 seconds
    items: 2
    itemsDesktop: [ 1199, 3 ]
    itemsDesktopSmall: [ 979, 3 ]
    
    #Auto height
    autoHeight: false

$(document).ready ->
	$("#teams").accordion()

$(document).ready ->
  $("#menu_right li").hover (->
    clearTimeout $.data(this, "timer")
    $("ul", this).stop(true, true).slideDown 200
  ), ->
    $.data this, "timer", setTimeout($.proxy(->
      $("ul", this).stop(true, true).slideUp 200
    , this), 100)

$(document).ready ->
  $(".dropdown").hover (->
    $(this).children(".sub-menu").slideDown 200
  ), ->
    $(this).children(".sub-menu").slideUp 200