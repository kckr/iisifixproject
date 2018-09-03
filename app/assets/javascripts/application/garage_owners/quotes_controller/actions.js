$(document).ready(function () {
  if ($('.garage_owner.quote_requests').length == 0) return false;
  $('.ignoreQuoteRequest').click(function () {
    var $link = $(this);
    bootbox.confirm("Do you really want to ignore this request?", function (result) {
      $.config.send_action_to_server_for_($link, result)
    });
  });

});
