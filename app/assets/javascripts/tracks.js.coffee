$('.button_to').hide()
$('.results').on 'click', (event) ->
  $(this).find('.button_to').trigger("submit") if $(event.target).hasClass('results')
