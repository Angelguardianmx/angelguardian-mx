$ ->
  $('.search').live 'click', (e) ->
    e.preventDefault()
    type = $(@).siblings('input[name=type]').first().val()
    search = $(@).siblings('input#search-term').first().val()

    $.get "/admin/portadas/1/#{type}/#{search}.js"