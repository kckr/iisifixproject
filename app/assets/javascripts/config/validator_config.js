$.validator.methods.email = function (value, element) {
  return this.optional(element) || /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value);
};

$.validator.methods.url = function (value, element) {
  return this.optional(element) || /(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/g.test(value);
};

/////////////////////////////////////////
jQuery.validator.setDefaults({
  errorClass: "validation-error",
  errorElement: "div",
  highlight: function (element) {
    $(element).closest('.form-group').addClass('has-validation-error');
    return
  },
  unhighlight: function (element) {
    $(element).closest('.form-group').removeClass('has-validation-error');
    return
  },
  errorPlacement: function (error, element) {
    previous_error_object = $(document).find('#' + error[0].id);
    if (previous_error_object.length > 0) {
      previous_error_object.remove();
    }

    if (element[0].id == 'garage_owner_setting_attributes_agreed_to_terms_and_condition'
        || element[0].id == 'vehicle_owner_setting_attributes_agreed_to_terms_and_condition'
        || element[0].id == 'quote_request_agree_quote_request_t_c'
        || element[0].id == 'quote_request_agree_katsastus_t_c'
    ) {
      element.parent().append(error)
    } else if (element.parent('.input-group').length > 0) {
      error.insertAfter(element.parent());
    } else {
      error.insertAfter(element)
    }
  }
});

/////////////////////////////////////////////////////////////////////////////////////
$.validator.addMethod('fileSize', function (value, element, param) {
  return this.optional(element) || (element.files[0].size <= param)
}, 'File size must be less than {0}');

$.validator.addMethod('fileType', function (value, element, param) {
  return this.optional(element) || (param.test(value))
}, 'You are only allowed to upload the allowed types: ' + $.config.validFileExtensions.join(', '));
