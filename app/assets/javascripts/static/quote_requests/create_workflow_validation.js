$(function () {
  // Only applicable to Search Forms
  if ($('.quote_requests').length == 0) return false;
  $('.new_quote_request').validate({
    ignore: ":hidden:not(#quote_request_agree_quote_request_t_c, #quote_request_agree_katsastus_t_c, #quote_request_vehicle_registration_number)",
    rules: {
      "quote_request[vehicle_registration_number]": {
        remote: {
          url: '/quote_requests/validate_reg_num',
          type: 'get',
          dataFilter: function(data) {
            if(data != false){
              var jsondata = JSON.parse(data);
              $('#quote_request_vehicle_made_year').val(jsondata.make_year);
              $('#quote_request_vehicle_vendor_id').val(jsondata.make_id);

              var options = '<input class="form-control" placeholder="Eg. AUDI 100" type="text" name="quote_request[vehicle_model]" id="quote_request_vehicle_model" autocomplete="off">';
              $(document).find('#quote_request_vehicle_model').replaceWith(options);
              $('#quote_request_vehicle_model').val(jsondata.model);

              $('#Cars3').show();
              $('#Cars3 h4').hide();
              return '"true"';
            }
          }
        }
      },
      "quote_request[report]": {
        fileType: $.config.validReportFileExtensionsRegex,
        fileSize: $.config.maxUploadedFileSizeInKB
      },
      "quote_request[agree_katsastus_t_c]": {
        required: true
      },
      "quote_request[agree_quote_request_t_c]": {
        required: true
      },
      "user[email]": {
        required: true,
        email: true
      },
      "quote_request[vehicle_model]": {
        required: function () {
          return $('#quote_request_vehicle_registration_number').val() == '';
        }
      },
      "quote_request[mileage]": {
        required: function () {
          return $('#quote_request_vehicle_registration_number').val() == '';
        }
      }

    },
    messages: {
      "quote_request[vehicle_registration_number]": {
        remote: 'Invalid Registration Number, please try again.'
      },
      "quote_request[report]": {
        fileType: 'You are only allowed to upload the allowed types: jpg, png, jpeg, PDF',
        fileSize: 'You cannot upload report file of more than 6 MB'
      },
      "quote_request[agree_katsastus_t_c]": {
        required: 'You have to agree to Katsastus Terms and Conditions'
      },
      "quote_request[agree_quote_request_t_c]": {
        required: 'You have to agree to Quote Request Terms and Conditions'
      },
      "user[email]": {
        required: 'You must provide your email address to proceed forward',
      }
    }
  });

  $('.next-to-step2, .workflow-step-2, #submit-quote-request').click(function (e) {
    if ($('#quote_request_vehicle_registration_number, #quote_request_vehicle_model, #quote_request_mileage').valid() == true) {
      return true;
    } else {
      e.preventDefault();

      if ($('#quote_request_vehicle_registration_number').valid() == false) {
        $('.workflow-step-1').click();
        $('.js-gotop').click();
      }
      return false;
    }
  })
});
