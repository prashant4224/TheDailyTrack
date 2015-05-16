$(document).ready ->
	$("#teams").accordion()

$(document).ready ->
	$('#datepicker').datepicker()

$(document).ready ->
  $("a").on "click", (e) ->
    e.preventDefault()

  $("#menu_right li").hover (->
    clearTimeout $.data(this, "timer")
    $("ul", this).stop(true, true).slideDown 200
  ), ->
    $.data this, "timer", setTimeout($.proxy(->
      $("ul", this).stop(true, true).slideUp 200
    , this), 100)

