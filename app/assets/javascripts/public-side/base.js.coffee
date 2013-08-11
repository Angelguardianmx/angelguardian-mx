$ ->
  $('#foto-nota').carousel()
  $('#opinion').carousel interval: 15000

  $("img.lazy").lazyload effect: "fadeIn"

  $('.go-top').on 'click', (e) ->
    e.preventDefault()
    $('body').scrollTop(0)

  $.getJSON "https://twitter.com/users/angelguardianmx.json?callback=?", (data) ->
    $('#twt-count').text data.followers_count

  $.getJSON "https://graph.facebook.com/angelguardianmx", (data) ->
    $('#fb-count').text data.likes

  $('#search').keypress (e) ->
    if e.which is 13
      query = $(@).val()
      if query.length > 0
        $.get "/search/#{query}"
