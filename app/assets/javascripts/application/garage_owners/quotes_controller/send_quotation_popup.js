$(document).ready(function () {
  if ($('.garage_owner.quote_requests').length == 0) return false;

  $respondQuoteRequestLink = $('.respondQuoteRequest');

  // Magnific popup callbacks did not work, so this is written
  $respondQuoteRequestLink.click(function(){
    $popup = $('#responseToQuoteRequest');
    $popup.find('form').attr('action', $(this).data('response-url'));
    $popup.find('#quoteRequestUrl').attr('href', $(this).data('quote-request-url'));

    $popup.find('#customerName').html($(this).data('customer-name'));
    $popup.find('#vehicleVendor').html($(this).data('vehicle-vendor'));
    $popup.find('#vehicleModel').html($(this).data('vehicle-model'));
    $popup.find('input').not('[type="submit"], [type="hidden"]').val('');
  });

  // $respondQuoteRequestLink.magnificPopup({
  //   items: {
  //     src: '#responseToQuoteRequest',
  //     type: 'inline',
  //     showCloseBtn: true,
  //     modal: true
  //   }
  // });

  $("#quote_request_proposed_start_date, #quote_request_proposed_end_date").pickadate({
    selectMonths: true,
    selectYears: 100,
    min: new Date(1960, 0, 1),
    format: $.config.dateFormat,
    formatSubmit: $.config.dateFormat,
    hiddenName: true
  });

});
