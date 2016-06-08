# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

init = ->
  $('#rooms').imagesLoaded ->
    $('#rooms').masonry
      itemSelector: '.box'
      isFitWidth: true

  $('#myAffix').affix offset:
    top: 100
    bottom: ->
      @bottom = $('#footer').outerHeight(true)

  $affix = $('*[data-spy="affix"]')
  $affix.width $affix.parent().width()
  return

$(document).ready(init)
$(document).on('page:change', init)
