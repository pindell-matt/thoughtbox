'use_strict'

$(document).ready(function(){
  $('#search').on('keyup', function() {
    let text = $(this).val().toLowerCase()
        matches = []
        nonMatches = [];

    $('.link').each(function () {
      let title = $(this).children('.title').html()
          url = $(this).html().split(" ")[2];

      if (title.includes(text) || url.includes(text)) {
        matches.push($(this));
      } else {
        nonMatches.push($(this));
      }
    });

    $.each(matches, function(index, link) { link.parent('ul li').show() });
    $.each(nonMatches, function(index, link) { link.parent('ul li').hide() });
  })
})
