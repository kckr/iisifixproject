$(document).ready(function () {
  if ($('.garage_owner.garage_profiles').length == 0) return false;

  $("#garage_opening_time, #garage_closing_time").pickatime({format: 'HH:i'});

  $("#garage_established_at").pickadate($.config.pickAdateDefaultOptions);

  $('.edit_garage').validate({
    rules: {
      "garage[name]": {
        required: true,
        maxlength: 100
      },
      "garage[logo]": {
        fileType: $.config.validFileExtensionsRegex,
        fileSize: $.config.maxUploadedFileSizeInKB
      },
      "garage[cover]": {
        fileType: $.config.validFileExtensionsRegex,
        fileSize: $.config.maxUploadedFileSizeInKB
      },
      "garage[registration_number]": {
        required: true,
        maxlength: 100
      },
      "garage[established_at]": {
        required: true,
        date: true
      },
      "garage[email]": {
        required: true,
        email: true
      },
      "garage[address]": {
        maxlength: 100
      },
      "garage[state]": {
        maxlength: 100
      },
      "garage[city]": {
        maxlength: 100
      },
      "garage[zip]": {
        maxlength: 7
      },
      "garage[phone_number]": {
        required: true,
        digits: true,
        minlength: $.config.phoneLength,
        maxlength: $.config.phoneLength
      },
      "garage[fax_number]": {
        digits: true,
        minlength: 10,
        maxlength: 10
      },
      "garage[po_box_number]": {
        digits: true
      },
      "garage[facebook_link]": {
        url: true
      },
      "garage[google_map_link]": {
        url: true
      },
      "garage[pinterest_link]": {
        url: true
      },
      "garage[twitter_link]": {
        url: true
      },
      "garage[website_link]": {
        url: true
      }
    }, messages: {
      'garage[logo]':{
        fileSize: 'The filesize must not exceed 2MB'
      },
      'garage[cover]':{
        fileSize: 'The filesize must not exceed 2MB'
      }
    }
  });

});
