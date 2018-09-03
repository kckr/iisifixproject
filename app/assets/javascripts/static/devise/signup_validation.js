$(document).on('ready', function () {
  if ($('.user.registrations.new').length == 0) return false;

  var options = {
    rules: {
      "user[email]": {
        required: true,
        email: true
      }
    }
  };

  $('#vehicle_owner_signup').validate(options);
  $('#garage_owner_signup').validate(options);

});
