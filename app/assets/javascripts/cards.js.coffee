if window.location.pathname.match /cards\/new/
  $(document).on 'click', '#yes-card', ->
    $('#prompt').slideUp()
    $('form#new_card').slideDown()
