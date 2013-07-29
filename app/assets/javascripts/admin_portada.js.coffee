$ ->

  $('a.search').live 'click', (e) ->
    e.preventDefault()
    type = $(@).siblings('input[name=type]').first().val()
    search = $(@).siblings('input#search-term').first().val()
    portada_id = $("#portada_id").val()

    $.get "/admin/portadas/#{portada_id}/#{type}/#{search}.js"

  $.fn.editable.defaults.ajaxOptions = {type: "PUT"};
  $('.editable').editable();

  $('.radio-post-select').live 'click', (e) ->
    if $(@).is(':checked')
      $("##{$(@).data('id')}").val($(@).val())

  $('input[name="related"]').live 'click', (e) ->
    if $(@).is(':checked')
      id = $(@).val()
      txt = $("#post_n_#{id}").text()
      element = "<li>- #{txt}</li>"
      index = $('.related').length
      hidden = "<input type='hidden' class='related' id='h_#{id}' name='post[related_attributes][#{index}][id]' value='#{id}' />"
      $('ul.droppable').append(element)
      $('ul.droppable').append(hidden)

  $('.delete-note').live 'click', (e) ->
    e.preventDefault()
    selector = $(@).data('type')
    $("input[id^='#{selector}']").each (i, item) ->
      if i == 0
        if selector == 'portada_special_note'
          console.log $(item).parents('.search-news').find('tr').last().remove()
        else
          console.log $(item).parents('.fieldset').siblings('.search-news').find('tr').last().remove()
      item.value = ''

    $("input[type^='radio' id^='#{selector}']").each (i, item) ->
      console.log item
  $('.is_header').live 'click', (e) ->
    id = $(@).data('id')
    if $(@).is(':checked')
      value = true
    else
      value = false
    data = {category: {header: value}}
    $.ajax
      url: "/admin/categories/#{id}"
      type: "PUT"
      data: data
      success: (data) ->
        console.log "Load was performed."

  $('.is_footer').live 'click', (e) ->
    id = $(@).data('id')
    if $(@).is(':checked')
      value = true
    else
      value = false
    data = {category: {footer: value}}
    $.ajax
      url: "/admin/categories/#{id}"
      type: "PUT"
      data: data
      success: (data) ->
        console.log "Load was performed."


  $(".datepicker").datepicker(format: "dd/mm/yyyy").on "changeDate", (ev) ->
    $(ev.target).attr "value", ev.date





