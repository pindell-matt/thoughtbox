$(document).ready(function(){
  $('#reset').on('click', function() {
    $('.link').parent('ul li').show();
  });

  $('#all-read').on('click', function() {
    $('.read').parent('ul li').show();
    $('.unread').parent('ul li').hide();
  });

  $('#all-unread').on('click', function() {
    $('.unread').parent('ul li').show();
    $('.read').parent('ul li').hide();
  });
})
