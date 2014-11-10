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



$ ->
  $(window).scroll ->
    url = $('.pagination .next a').attr('href')
    if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
      $('.pagination').text("Digging for tracks...")

      $.getScript(url, (data, textStatus, jqxhr) ->
        $.getScript("assets/application.js.coffee")
        
        console.log data
        console.log textStatus
        console.log jqxhr.status
        return
      ).done(->
        console.log($('.audioplayer .audioplayer').siblings())
      )

