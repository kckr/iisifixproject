$(document).ready(function () {
  if ($('.vehicle_owner.quote_requests').length == 0) return false;

  $('.cancelQuoteRequest').click(function () {
    var $link = $(this);
    bootbox.confirm("Do you really want to cancel this request?", function (result) {
      $.config.send_action_to_server_for_($link, result)
    });
  });

  $('.acceptQuoteRequest').click(function () {
    var $link = $(this);
    bootbox.confirm("Do you really want to accept this proposition?", function (result) {
      $.config.send_action_to_server_for_($link, result)
    });
  });

  $('.rejectQuoteRequest').click(function () {
    var $link = $(this);
    bootbox.confirm("Do you really want to reject this proposition?", function (result) {
      $.config.send_action_to_server_for_($link, result)
    });
  });

});
