if window.location.pathname.match /cards\/new/
  $ ->
    # $('#yes-card').on 'click', ->
    
    $(document).on 'click', '#yes-card', ->
      $('#prompt').slideUp()
      $('form#new_card').slideDown()

    $('button.use-entry').on 'click', ->
      $(this).toggleClass('btn-success')
