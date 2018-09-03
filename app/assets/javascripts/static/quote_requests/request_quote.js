// For adding validation: http://formvalidation.io/examples/bootstrap-wizard/
$(document).ready(function () {
  $("input[name='cars']").click(function() {
      var test = $(this).val();
      $("div.desc").hide();
      $("#Cars" + test).show();
  });

  if ($('.quote_requests').length == 0) return false;

  $('#dontRememberCarNumber').change(function () {
    toggle('#carDetailForm', $(this));
  });

  $('#dontHaveKastastus').change(function () {
    toggle('#problemForm', $(this));
    if ($(this).is(":checked")) {
      $('#quote_request_agree_katsastus_t_c').closest('.form-group').hide();
      $('#quote_request_agree_katsastus_t_c').prop('checked', true);
      $('#quote_request_report').prop('disabled', true);
    }
    else {
      $('#quote_request_agree_katsastus_t_c').closest('.form-group').show();
      $('#quote_request_agree_katsastus_t_c').prop('checked', false);
      $('#quote_request_report').prop('disabled', false);
    }
  });

  $('.serviceCheckbox').change(function(){
    if ($(this).is(":checked")) {
      $(this).siblings('.serviceDescription').show();
    }
    else {
      $(this).siblings('.serviceDescription').hide();

    }
  });

  function toggle(selector, $checkbox) {
    if ($checkbox.prop('checked')) $(selector).removeClass('hidden');
    else $(selector).addClass('hidden');
  }

  $('#requestQuoteForm').bootstrapWizard();

  $(document).find('#quote_request_vehicle_vendor_id').change(function(){
    $.ajax({
      type: 'post',
      url: '/quote_requests/load_models/',
      data: {vehicle: { vendor_id: $(this).val()}},
      dataType: 'script'
    })
  });
});
