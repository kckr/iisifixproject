$(document).ready(function () {
  if ($('.user.passwords').length == 0) return false;
  options = {
    rules: {
      "user[email]": {
        required: true,
        email: true
      },
      "user[password]": {
        required: true,
        minlength: 8,
        maxlength: 30
      },
      "user[password_confirmation]": {
        required: true,
        minlength: 8,
        maxlength: 30,
        equalTo: $('#user_password')
      }
    }
  };
  $('.new_user').validate(options);
  $('.edit_user').validate(options);
});
