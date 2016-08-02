'use_strict'

$(document).ready(function(){
  $('#search').on('keyup', function() {
    let text = $(this).val().toLowerCase()

    let matches = []
    let nonMatches = []

    $('.link').each(function () {
      let title = $(this).children('.title').html()
      let url = $(this).html().split(" ")[2]

      if (title.includes(text) || url.includes(text)) {
        matches.push($(this))
      } else {
        nonMatches.push($(this))
      }
    })

    $.each(matches, function(index, link) { link.parent('ul li').show() });
    $.each(nonMatches, function(index, link) { link.parent('ul li').hide() });
  })
})
