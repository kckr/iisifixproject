$(document).ready(function () {
  if ($('.confirmations.edit, .confirmations.update').length == 0) return false;

  $("#vehicle_owner_date_of_birth").pickadate($.config.pickAdateDefaultOptions);

  $('.edit_vehicle_owner').validate({
    ignore: ":hidden:not(#vehicle_owner_setting_attributes_agreed_to_terms_and_condition)",
    rules: {
      "vehicle_owner[first_name]": {
        required: true,
        maxlength: 20
      },
      "vehicle_owner[last_name]": {
        required: true,
        maxlength: 20
      },
      "vehicle_owner[date_of_birth]": {
        date: true
      },
      "vehicle_owner[phone_number]": {
        required: true,
        digits: true,
        minlength: $.config.phoneLength,
        maxlength: $.config.maxPhoneLength
      },
      "vehicle_owner[password]": {
        required: true,
        minlength: 8,
        maxlength: 30
      },
      "vehicle_owner[password_confirmation]": {
        required: true,
        minlength: 8,
        maxlength: 30,
        equalTo: $('#vehicle_owner_password')
      },
      "vehicle_owner[setting_attributes][agreed_to_terms_and_condition]": {
        required: true
      },
      "vehicle_owner[company_url]": {
        url: true
      }
    },
    messages:{
      "vehicle_owner[setting_attributes][agreed_to_terms_and_condition]": {
        required: 'You have to agree to the <strong>Terms and Conditions</strong> to continue'
      }
    }
  })

});
