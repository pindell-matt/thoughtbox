$(document).ready(function(){
  $('#search').on('keyup', function() {
    var text = $(this).val().toLowerCase();
    var matches = [];
    var nonMatches = [];

    $('.link').each(function () {
      var title = $(this).children('.title').html();
      var url = $(this).html().split(" ")[2];

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
