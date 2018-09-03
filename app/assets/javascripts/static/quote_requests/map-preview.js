$(function () {
  // Only applicable to Search Forms
  if ($('#map').length == 0) return false;

  $('#map').height($(document).height() * 0.7);

  $(document).scroll(function () {
    var topPositionOfRequestButton = $('#sendQuoteRequestToSelected').offset().top - $(window).height() + 150;
    var topPositionOfSearchButton = $('.iisifixco-section').offset().top;
    if ($(document).scrollTop() > topPositionOfSearchButton && $(document).scrollTop() < topPositionOfRequestButton) {
      $('#map').addClass('fixedMap');
    } else {
      $('#map').removeClass('fixedMap');
    }
  });

  $('.pin-on-map').hover(function () {
    var coord = {lat: Number($(this).data('lat')), lng: Number($(this).data('lng'))};
    google.maps.event.trigger(map, 'resize');
    map.setCenter(coord);
  });

  $('.select-garage').change(function () {
    if ($(this).is(":checked")) {
      markers[$(this).data('marker-id')].setAnimation(google.maps.Animation.BOUNCE);
    }
    else {
      markers[$(this).data('marker-id')].setAnimation(null);
    }
  });

  $('.show-map').click(function(){
    $(this).parents('.search_garage_each').find('.map-for-mobile-device').toggleClass('hidden');
  });
});
