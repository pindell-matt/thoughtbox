'use_strict'

$(document).ready(function(){
  $('#alphabetic').on('click', () => {
    let $ul = $('ul');
    let links = $ul.children();

    links.sort(function(t1, t2) {
      let title1 = $(t1).children('div').children('.title').html();
      let title2 = $(t2).children('div').children('.title').html();
      return title1.localeCompare(title2);
    })

    $.each(links, function(i, l) { $ul.append(l); });
  });
})
