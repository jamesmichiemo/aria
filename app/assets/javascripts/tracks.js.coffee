$('.button_to').hide()
$('.results').on 'click', (event) ->
  $(this).find('.button_to').trigger("submit") if $(event.target).hasClass('results')
$('.favorite').click ->
  console.log $(this).parent().parent().find('.artcover img').attr('src')
  image_url = $(this).parent().parent().find('.artcover img').attr('src')
  key = $(this).parent().parent().find('.key').text()
  bpm = $(this).parent().parent().find('.bpm').text()
  artist = $(this).parent().parent().find('.artists').text()
  title = $(this).parent().parent().find('.title').text()
  track_id = $(this).parent().parent().attr('id')

  $.ajax
    type: "POST"
    url: 'favorites/' + track_id
    data: { image_url: image_url, key: key, bpm: bpm, artist: artist, title: title, track_id: track_id }
    success: ->
      # switch favorites button image
  return
