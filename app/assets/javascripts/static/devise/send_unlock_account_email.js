$(document).ready(function () {
  if ($('.user.unlocks').length == 0) return false;
  $('.new_user').validate();
  $('.edit_user').validate();
});
