# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $(".new-comment-text").keypress (e) ->
    if e.keyCode is 13 and not e.shiftKey
      e.preventDefault()

      frm = $(this).closest("form")
      url = frm.attr("action")
      $.ajax
        url: url
        format: 'js'
        type: "POST"
        data: frm.serialize()