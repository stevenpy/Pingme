$( document ).ready(function() {
  $('.more-comments').click( function() {
    $(this).on('ajax:success', function(event, data, status, xhr) {
      var pingId = $(this).data("ping-id");
      $("#comments_" + pingId).html(data);
      $("#comments-paginator-" + pingId).html("<a id='more-comments' data-ping-id=" + pingId + "data-type='html' data-remote='true' href='/pings/" + pingId + "/comments>show more comments</a>");
    });
  });
});