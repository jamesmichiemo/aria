$('.button_to').hide()
$('.results').on 'click', (event) ->
  $(this).find('.button_to').trigger("submit") if $(event.target).hasClass('results')
$('.favorited').on "click", (event) ->
  $(this).hide()
  $(this).siblings('.unfavorited').show()
$('.unfavorited').on "click", (event) ->
  $(this).hide()
  $(this).siblings('.favorited').show()
$('.favorited.saved').on "click", (event) ->
  $(this).closest('.favorite').fadeOut("slow")

# $ ->
#   $('#results .page').infinitescroll
#     navSelector: "nav.pagination"
#     nextSelector: "nav.pagination a[rel=next]"
#     itemSelector: "#results li.result"
#   , (arrayOfNewElems) ->
#     #$('.button_to').hide()
#     $('.results').on 'click', (event) ->
#       $(this).find('.button_to').trigger("submit") if $(event.target).hasClass('results')
#     $('.favorited').on "click", (event) ->
#       $(this).hide()
#       $(this).siblings('.unfavorited').show()
#     $('.unfavorited').on "click", (event) ->
#       $(this).hide()
#       $(this).siblings('.favorited').show()
#     $('.favorited.saved').on "click", (event) ->
#       $(this).closest('.favorite').fadeOut("slow")
   #this.audioPlayer(jQuery, window, document)
