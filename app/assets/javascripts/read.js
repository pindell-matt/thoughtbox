'use_strict'

$(document).ready(function(){
  loadLinks

  $('div').on('click', '.status', function(event){
    let link = $(this).parent()[0];
    let data = { id: link.id }
    let url = 'api/v1/links/' + link.id

    $.ajax({
      method: 'PATCH',
      url: url,
      data: data,
      dataType: 'JSON',
      success: loadLinks,
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

let renderLink = (link) => {
  let html = formatLink(link);
  appendLink(link.id, html);
}

let formatLink = (data) => {
  let title = data.title,
      url = data.url,
      status = linkStatus(data);

  return html =
    '<div class="link ' + status + '" id=' + data.id + '>' + title + ': ' + url + ' ' +
    buttonFormat(data) + '</div>'
}

let buttonFormat = (data) => {
  status = linkStatus(data);
  text = statusText(status);
  return '<button class="status" value=' + data.id + '>Mark as ' + text + '</button>'
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
