if window.location.pathname.match /cards\/new/
  $ ->
    # $('#yes-card').on 'click', ->
    $(document).on 'click', '#yes-card', ->
      $('#prompt').slideUp()
      $('form#new_card').slideDown()

    $(document).on 'click', '#expressions.accordion .use-entry', (evt) ->
      removeEntryFromList entryId
      entry = $(this).closest('.accordion-group')
      entry.remove()

    $('.btn.use-entry').on 'click', (evt) ->
      evt.preventDefault()

      $(this).toggleClass('btn-success')
      clearSelection()

      entryId = $(this).data('id')

      if $(this).hasClass('btn-success')
        # addHiddenFieldForEntry entryId
        addEntryToList entryId
      else
        # removeHiddenFieldForEntry entryId
        removeEntryFromList entryId

    $('.btn.use-all').on 'click', (evt) ->
      modal = $(this).closest('.modal')
      entryBtns = modal.find('.use-entry.btn')
      uncheckedEntryBtns = _.reject entryBtns, (btn) ->
        $(btn).hasClass('btn-success')
      _.each uncheckedEntryBtns, (btn) ->
        $(btn).trigger 'click'

    $('span.char').on 'click', (evt) ->
      window.charNum = $(this).index('span.char') + 1
      


    entryItemId = (entryId) ->
      "char#{charNum}entry#{entryId}"

    hiddenFieldForEntry = (entryId) ->
      input = $ '<input>',
        type: 'hidden'
        name: "card[expressions][#{charNum}][]"
        value: entryId

    addEntryToList = (entryId) ->
      entry = $("#accordion-entry#{entryId}").clone()
      list  = $("#expressions.accordion")
      input = hiddenFieldForEntry(entryId)
      entry.append(input)
      list.append(entry)

    removeEntryFromList = (entryId) ->
      id   = "#accordion-entry#{entryId}"
      list = $("#expressions.accordion")
      list.remove(id)

    removeHiddenFieldForEntry = (entryId) ->
        id    = entryItemId(entryId)
        entry = $("##{id}")
        entry.remove()

    clearSelection = ->
        if window.getSelection
          window.getSelection().removeAllRanges()
        else if document.selection
          document.selection.empty()
