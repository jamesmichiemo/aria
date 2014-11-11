$ ->
  $(window).scroll ->
    url = $('.pagination .next a').attr('href')
    if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
      $('.pagination').text("Diggin for tracks...")
      $.getScript(url, (data, textStatus, jqxhr) ->
        $.getScript("../assets/application.js.coffee")
        return
      )

