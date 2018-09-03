$(document).ready(function () {
  if ($('.vehicle_owner.jobs').length == 0) return false;

  $('.cancelJob').click(function () {
    var $link = $(this);
    bootbox.confirm("Do you really want to cancel this job?", function (result) {
      $.config.send_action_to_server_for_($link, result)
    });
  });

});
