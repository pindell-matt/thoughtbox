'use_strict'

$(document).ready(function() {
  $('div').on('click', '.status', function(event) {
    var link = $(this).parent()[0];
    var data = { id: link.id };
    var url = 'api/v1/links/' + link.id;

    $.ajax({
      method: 'PUT',
      url: url,
      data: data,
      dataType: 'JSON',
      success: updateLink(data),
      error: function(data){
        alert("Error updating Link " + link.id);
      }
    })
  })
})

var loadLinks = $.getJSON('/api/v1/links').then(
  function(response) {
    $.each(response, function(index, link) {
      renderLink(link);
    })
  }
)

var updateLink = function(data) {
  var id = data.id;
  var idea = $('#' + id);
  updateLinkButton(idea);
  idea.toggleClass("unread")
      .toggleClass("read");
}

var updateLinkButton = function(idea) {
  var button = idea.children('.status');
  var map = {
             "Mark as Unread": "Mark as Read",
             "Mark as Read": "Mark as Unread"
            };
  var newStatus = map[button.html()];
  button.html(newStatus)
}

var renderLink = function(link) {
  var html = formatLink(link);
  appendLink(link.id, html);
}

var formatLink = function(data) {
  var title = data.title;
  var url = data.url;
  var status = linkStatus(data);

  return html =
    '<div class="link ' + status + ' ' + '" id=' + data.id + '>' +
    '<span class="title">' + title + "</span>" + ': ' +
    url + ' ' + statusButton(data) + editButton(data) +'</div>';
}

var statusButton = function(data) {
  var status = linkStatus(data);
  var text = statusText(status);
  return '<button class="status" value=' +
    data.id + '>Mark as ' + text + '</button>';
}

var editButton = function(data) {
  return '<a href="/links/' + data.id + '/edit">' +
    '<button class="edit">Edit</button></a>';
}

var linkStatus = function(data) {
  if (data.read) { return 'read' } else { return 'unread' };
}

var statusText = function(status) {
  if (status === 'read') { return 'Unread' } else { return 'Read' };
}

var appendLink = function(id, html) {
  $( ".links ul" ).prepend(
    '<li>' + html + '</li>'
  );
}
