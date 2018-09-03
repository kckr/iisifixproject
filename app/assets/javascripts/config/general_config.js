$.config = {};
$.config.dateFormat = 'dd/mm/yyyy';
$.config.phoneLength = 9;
$.config.maxPhoneLength = 9;
$.config.validFileExtensions = ['jpg', 'png', 'jpeg'];
$.config.validFileExtensionsRegex = /\.(jpe?g|png|gif|bmp)$/i;
$.config.validReportFileExtensionsRegex = /\.(jpe?g|png|gif|pdf)$/i;
$.config.maxUploadedFileSizeInKB = 6291456; // 6MB 6*1024*1024

$.config.send_action_to_server_for_ = function ($link, confirmation_result) {
  if (confirmation_result === true) {
    $.ajax({
      url: $link.data('target-url'),
      type: 'patch'
    })
  }
};

$.config.pickAdateDefaultOptions = {
  selectMonths: true,
  selectYears: 100,
  min: new Date(1960, 0, 1),
  format: $.config.dateFormat,
  formatSubmit: $.config.dateFormat,
  hiddenName: true
};

$.showFlashMessage = function (message, type) {
  var bar = '<div class="the-flash alert alert-' + type + ' main_alert" role="alert">' +
      '<a class="close" href="#" data-dismiss="alert" aria-label="close"> &times</a>' +
      message +
      '</div>';
  $(bar).insertAfter('header')
};
