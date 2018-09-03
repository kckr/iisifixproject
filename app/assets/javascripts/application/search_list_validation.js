$(function () {
  // Only applicable to Search Forms
  if ($('#searchText').length == 0) return false;
  $('#sendQuoteRequestToSelected').click(function(e){
    if ($('#new_quote_request').find('input[type="checkbox"]:checked').length == 0){
      e.preventDefault();
      $('.js-gotop').click();
      $.showFlashMessage('You need to select at least one item to continue', 'danger');
    }else if($('#new_quote_request').find('input[type="checkbox"]:checked').length > 5){
      e.preventDefault();
      $('.js-gotop').click();
      $.showFlashMessage('You need to select at most 5 items to continue', 'danger');
    }
  })
});
