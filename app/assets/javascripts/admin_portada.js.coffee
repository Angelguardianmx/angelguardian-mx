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

