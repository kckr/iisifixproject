$(document).ready(function () {
  if ($('.user.confirmations').length == 0) return false;
  $('.new_user').validate();
  $('.edit_user').validate();
});
