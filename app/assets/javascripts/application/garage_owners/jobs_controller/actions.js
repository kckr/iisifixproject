$(document).ready(function () {
  if ($('.garage_owner.jobs').length == 0) return false;

  $('.startJob').click(function () {
    var $link = $(this);
    bootbox.confirm("Do you really want to start this job?", function (result) {
      $.config.send_action_to_server_for_($link, result)
    });
  });

  $('.completeJob').click(function () {
    var $link = $(this);
    var message = "Do you really want to mark this job as done?" +
                  "<br>This will need customer's confirmation. We will ask customer to verify the job.";
    bootbox.confirm(message, function (result) {
      $.config.send_action_to_server_for_($link, result)
    });
  });

});
