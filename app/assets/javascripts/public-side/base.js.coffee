$ ->
  $('#foto-nota').carousel()
  $('#opinion').carousel interval: 15000

  $("img.lazy").lazyload effect: "fadeIn"

  $('.go-top').on 'click', (e) ->
    e.preventDefault()
    $('body').scrollTop(0)
