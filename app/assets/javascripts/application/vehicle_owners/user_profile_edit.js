$(document).ready(function () {
  if ($('.vehicle_owner.users.edit').length == 0) return false;

  $("#vehicle_owner_date_of_birth").pickadate($.config.pickAdateDefaultOptions);

  $('.edit_vehicle_owner').validate({
    rules: {
      "vehicle_owner[email]": {
        required: true,
        email: true
      },
      "vehicle_owner[avatar]": {
        fileType: $.config.validFileExtensionsRegex,
        fileSize: $.config.maxUploadedFileSizeInKB
      },
      "vehicle_owner[first_name]": {
        required: true,
        maxlength: 100
      },
      "vehicle_owner[last_name]": {
        required: true,
        maxlength: 100
      },
      "vehicle_owner[phone_number]": {
        required: true,
        digits: true,
        minlength: $.config.phoneLength,
        maxlength: $.config.maxPhoneLength
      },
      "vehicle_owner[date_of_birth]": {
        required: true,
        date: true
      },
      "vehicle_owner[password]": {
        required: false,
        minlength: 8,
        maxlength: 30
      },
      "vehicle_owner[password_confirmation]": {
        required: false,
        minlength: 8,
        maxlength: 30,
        equalTo: $('#vehicle_owner_password')
      },
      "vehicle_owner[company_url]": {
        url: true
      }
    }
  });

});
