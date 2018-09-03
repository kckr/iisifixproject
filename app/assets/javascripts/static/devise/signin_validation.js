$(document).on('ready', function () {
  if ($('.user.sessions.new').length == 0) return false;

  var options = {
    rules: {
      "user[email]": {
        required: true,
        email: true
      },
      "user[password]": {
        required: true,
        minlength: 8,
        maxlength: 30
      }
    }
  };

  $('#new_user').validate(options);

});
