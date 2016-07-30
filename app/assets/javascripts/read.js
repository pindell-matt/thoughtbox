'use_strict'

$(document).ready(function(){
  $('div').on('click', '.status', function(event){
    let link = $(this).parent()[0];
    let data = { id: link.id }
    let url = 'api/v1/links/' + link.id

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

let loadLinks = $.getJSON('/api/v1/links').then(
  (response) => {
    $.each(response, (index, link) => {
      renderLink(link);
    })
  }
)

let updateLink = (data) => {
  let id = data.id;
  let idea = $('#' + id)
  idea.toggleClass("unread")
      .toggleClass("read");

  // refactor
  let button = idea.children('.status')
  let map = { "Mark as Unread": "Mark as Read", "Mark as Read": "Mark as Unread" }
  let newStatus = map[button.html()]
  button.html(`${newStatus}`)
}

let renderLink = (link) => {
  let html = formatLink(link);
  appendLink(link.id, html);
}

let formatLink = (data) => {
  let title = data.title,
      url = data.url,
      status = linkStatus(data);

  return html =
    '<div class="link ' + status + '" id=' + data.id + '>' +
    title + ': ' + url + ' ' + statusButton(data) + editButton(data) +'</div>';
}

let statusButton = (data) => {
  status = linkStatus(data);
  text = statusText(status);
  return '<button class="status" value=' + data.id + '>Mark as ' + text + '</button>';
}

let editButton = (data) => {
  return '<a href="/links/' + data.id + '/edit"><button class="edit">Edit</button></a>';
}

let linkStatus = (data) => {
  if (data.read) { return 'read' } else { return 'unread' };
}

let statusText = (status) => {
  if (status === 'read') { return 'Unread' } else { return 'Read' };
}

let appendLink = (id, html) => {
  $( ".links ul" ).prepend(
    '<li>' + html + '</li>'
  );
}
