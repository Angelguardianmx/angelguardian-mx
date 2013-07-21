$ ->
  $('.carousel').carousel()

  $("img.lazy").lazyload effect: "fadeIn"

  $('.go-top').on 'click', (e) ->
    e.preventDefault()
    $('body').scrollTop(0)
