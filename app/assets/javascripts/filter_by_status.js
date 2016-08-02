'use_strict'

$(document).ready(function(){

  $('#reset').on('click', () => {
    $('.link').parent('ul li').show()
  })

  $('#all-read').on('click', () => {
    $('.read').parent('ul li').show()
    $('.unread').parent('ul li').hide()
  })

  $('#all-unread').on('click', () => {
    $('.unread').parent('ul li').show()
    $('.read').parent('ul li').hide()
 })
})
