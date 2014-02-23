if window.location.pathname.match /cards\/new/
  $ ->
    # $('#yes-card').on 'click', ->
    
    $(document).on 'click', '#yes-card', ->
      $('#prompt').slideUp()
      $('form#new_card').slideDown()

    $('.btn.use-entry').on 'click', (evt) ->
      evt.preventDefault()
      $(this).toggleClass('btn-success')
      clearSelection()

    $('.btn.use-all').on 'click', (evt) ->
      modal = $(this).closest('.modal')
      entryBtns = modal.find('.use-entry.btn')
      uncheckedEntryBtns = _.reject entryBtns, (btn) ->
        $(btn).hasClass('btn-success')
      _.each uncheckedEntryBtns, (btn) ->
        $(btn).trigger 'click'



    clearSelection = ->
        if window.getSelection
          window.getSelection().removeAllRanges()
        else if document.selection
          document.selection.empty()
