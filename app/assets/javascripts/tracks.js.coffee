$('.button_to').hide()
$('.results').on 'click', (event) ->
  $(this).find('.button_to').trigger("submit") if $(event.target).hasClass('results')
$('.favorite').on "click", (event) ->
  $(this).hide()
  $('.unfavorite').show()
$('.unfavorite').on "click", (event) ->
  $(this).hide()
  $('.favorite').show()

