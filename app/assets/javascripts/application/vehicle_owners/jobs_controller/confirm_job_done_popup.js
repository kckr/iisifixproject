$(document).ready(function () {
  if ($('.vehicle_owner.jobs').length == 0) return false;

  $respondQuoteRequestLink = $('.confirmJob');

  // Magnific popup callbacks did not work, so this is written
  $respondQuoteRequestLink.click(function () {
    $popup = $('#jobDoneConfirmationPopup');
    $popup.find('form').attr('action', $(this).data('target-url'));
    $popup.find('#jobUrl').attr('href', $(this).data('job-url'));

    $popup.find('#garageName').html($(this).data('garage-name'));
    $popup.find('input,textarea').not('[type="submit"], [type="hidden"]').val('');
    $('.rateJob').removeClass('gold')
        .addClass('dark-grey');
  });

  $respondQuoteRequestLink.magnificPopup({
    items: {
      src: '#jobDoneConfirmationPopup',
      type: 'inline',
      showCloseBtn: true,
      modal: true
    }
  });

  $('.rateJob').click(function () {
    var $rateButtons = $('.rateJob');
    if ($(this).prev().length === 0 && $(this).nextAll('.gold').length === 0) {

      $(this).nextAll().removeClass('gold');
      $(this).nextAll().addClass('dark-grey');

      $(this).toggleClass('gold');
      $(this).toggleClass('dark-grey');
    } else {

      $rateButtons.removeClass('gold');
      $rateButtons.removeClass('dark-grey');
      $(this).nextAll().addClass('dark-grey');
      $(this).prevAll().addClass('gold');
      $(this).addClass('gold');

    }

    // Update input field
    var number_of_stars = $('.rateJob.gold').length;
    var $starField = $(this).parents('form').find('input[id$="_star_count"]');
    $starField.val(number_of_stars);
  });

  $('#iWouldLoveToPostReview').click(function(){
    $('#ratingFormInputFields').toggle();
  });

});
