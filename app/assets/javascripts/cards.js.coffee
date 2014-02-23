if window.location.pathname.match /cards\/new/
  $ ->
    # [X] on .use-entry.btn-success click
    # [X]   add hidden field to .accordion-group
    # [X]   add .accordion-group to list
    # [X] on .use-entry else click
    # [X]   remove .accordion-group list
    #
    # [X] on #expressions .use-entry.btn-success click
    # [X]   remove from list
    # [X]   unclick other .use-entry list by charIDentryID

    $entryList = $('#expressions.accordion')
    
    # $('#yes-card').on 'click', ->
    $(document).on 'click', '#yes-card', ->
      $('#prompt').slideUp()
      $('form#new_card').slideDown()

    $(document).on 'click', '#expressions.accordion .btn.use-entry', (evt) ->
      entry = $(this).closest('.accordion-group')
      entrySlug = entry.data('slug')

      entry.remove()

      selectedEntry = $(".entry-select.accordion .accordion-group[data-slug=#{entrySlug}]")
      entryBtn = selectedEntry.find('.btn-success')
      entryBtn.removeClass('btn-success').removeClass('active')


    $('.entry-select.accordion .btn.use-entry').on 'click', (evt) ->
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
      
    addEntryToList = (entryId) ->
      entry = cloneAccordionGroupForEntry(entryId)
      input = hiddenFieldForEntry(entryId)
      entry.append(input)
      $entryList.append(entry)

    removeEntryFromList = (entryId) ->
      entry = $entryList.find(".accordion-entry#{entryId}")
      entry.remove()

    getAccordionGroupForEntry = (entryId) ->
      $(".entry-select.accordion .accordion-entry#{entryId}")

    cloneAccordionGroupForEntry = (entryId) ->
      getAccordionGroupForEntry(entryId).clone()

    hiddenFieldForEntry = (entryId) ->
      input = $ '<input>',
        type: 'hidden'
        name: "card[expressions][#{charNum}][]"
        value: entryId
        data:
          charNum: charNum
 
    # hiddenFieldId = (entryId) ->
    #   "char#{charNum}entry#{entryId}"
 
    # addHiddenFieldForEntry = (entryId) ->
    #   input = $ '<input>',
    #     id:    hiddenFieldId(entryId)
    #     type: 'hidden'
    #     name: "card[expressions][#{charNum}][]"
    #     value: entryId
    #   $('form#new_card').append input

    removeHiddenFieldForEntry = (entryId) ->
        id    = hiddenFieldId(entryId)
        input = $("##{id}")
        input.remove()

    clearSelection = ->
        if window.getSelection
          window.getSelection().removeAllRanges()
        else if document.selection
          document.selection.empty()
