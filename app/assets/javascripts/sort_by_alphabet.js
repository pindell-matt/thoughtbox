'use_strict'

$(document).ready(function(){
  $('#alphabetic').on('click', () => {
    let $ul = $('ul')
        links = $ul.children();

    links.sort(function(t1, t2) {
      let title1 = $(t1).children('div, .title').html();
      let title2 = $(t2).children('div, .title').html();
      return title1.localeCompare(title2);
    });

    $.each(links, function(index, link) { $ul.append(link); });
  });
})
