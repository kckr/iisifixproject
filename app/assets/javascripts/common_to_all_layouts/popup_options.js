$(document).ready(function() {
  $('.imagePopup').magnificPopup({type:'image'});
  $('.iframePopup').magnificPopup({type:'iframe'});
});

$('.open-popup-link').magnificPopup({
  type: 'iframe',
  midClick: true // Allow opening popup on middle mouse click. Always set it to true if you don't provide alternative source in href.
});
