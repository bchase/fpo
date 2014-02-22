if window.location.pathname.match /cards\/new/
  $(document).on 'click', '#yes-card', ->
    $('#prompt').slideUp()
    $('form#new_card').slideDown()

  # $(document).on 'click', 'span.char', (evt) ->
  #   $(this).siblings('.entries').slideDown()
