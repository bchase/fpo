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

      entryId = $(this).data('id')

      if $(this).hasClass('btn-success')
        addHiddenFieldForEntry entryId
      else
        removeHiddenFieldForEntry entryId

    $('.btn.use-all').on 'click', (evt) ->
      modal = $(this).closest('.modal')
      entryBtns = modal.find('.use-entry.btn')
      uncheckedEntryBtns = _.reject entryBtns, (btn) ->
        $(btn).hasClass('btn-success')
      _.each uncheckedEntryBtns, (btn) ->
        $(btn).trigger 'click'

    $('span.char').on 'click', (evt) ->
      window.charNum = $(this).index('span.char') + 1
      


    hiddenFieldId = (entryId) ->
      "char#{charNum}entry#{entryId}"

    addHiddenFieldForEntry = (entryId) ->
      input = $ '<input>',
        id:    hiddenFieldId(entryId)
        type: 'hidden'
        name: "card[expressions][#{charNum}][]"
        value: entryId
      $('form#new_card').append input

    removeHiddenFieldForEntry = (entryId) ->
        id    = hiddenFieldId(entryId)
        input = $("##{id}")
        input.remove()

    clearSelection = ->
        if window.getSelection
          window.getSelection().removeAllRanges()
        else if document.selection
          document.selection.empty()
