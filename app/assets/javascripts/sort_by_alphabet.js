$(document).ready(function(){
  $('#alphabetic').on('click', function() {
    var $ul = $('ul');
    var links = $ul.children();

    links.sort(function(t1, t2) {
      var title1 = $(t1).children('div, .title').html();
      var title2 = $(t2).children('div, .title').html();
      return title1.localeCompare(title2);
    });

    $.each(links, function(index, link) { $ul.append(link); });
  });
})
