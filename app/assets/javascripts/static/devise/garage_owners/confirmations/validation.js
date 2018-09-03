$(document).ready(function () {
  if ($('.confirmations.edit').length == 0) return false;

  $("#garage_owner_date_of_birth").pickadate($.config.pickAdateDefaultOptions);

  $('.edit_garage_owner').validate({
    ignore: ":hidden:not(#garage_owner_setting_attributes_agreed_to_terms_and_condition)",
    rules: {

      "garage_owner[first_name]": {
        required: true,
        maxlength: 20
      },
      "garage_owner[last_name]": {
        required: true,
        maxlength: 20
      },
      "garage_owner[date_of_birth]": {
        date: true
      },
      "garage_owner[phone_number]": {
        required: true,
        digits: true,
        minlength: $.config.phoneLength,
        maxlength: $.config.maxPhoneLength
      },
      "garage_owner[password]": {
        required: true,
        minlength: 8,
        maxlength: 30
      },
      "garage_owner[password_confirmation]": {
        required: true,
        minlength: 8,
        maxlength: 30,
        equalTo: $('#garage_owner_password')
      },
      "garage_owner[setting_attributes][agreed_to_terms_and_condition]": {
        required: true
      }
    },
    messages: {
      "garage_owner[setting_attributes][agreed_to_terms_and_condition]": {
        required: 'You have to agree to the <strong>Terms and Conditions</strong> to continue'
      }
    }
  })

});
