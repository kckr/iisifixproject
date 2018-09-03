$(function () {
  // Only applicable to Search Forms
  if ($('#searchText').length == 0) return false;

  /**
   * Grab Lat,Long from browser
   * Note: This code is only going to work if your server is on secured origin
   * i.e. https://
   * Tips: use 'thin' server in ruby
   * $ thin start --ssl
   */
  $('#map-marker').click(function (e) {
    e.preventDefault();
    navigator.geolocation.getCurrentPosition(function (position) {
      var latElement = $('<input type="hidden" id="lat" name="lat"\>');
      var longElement = $('<input type="hidden" id="long" name="long"\>');

      if ($(document).find('#lat').length == 0) {
        $('#map-marker').parents('form').append(latElement);
      }

      if ($(document).find('#long').length == 0) {
        $('#map-marker').parents('form').append(longElement);
      }

      $('#map-marker').attr('data-original-title', 'Yeah!!!, We got your location.');
      $('#map-marker').tooltip('show');

      $(document).find('#lat').val(position.coords.latitude);
      $(document).find('#long').val(position.coords.longitude);

    });
  });

  /**
   * Embed data into the form for submitting to the server
   *   while slider value is changed
   */
  $('#rangeSlider').change(function () {

    if ($(document).find('#min_radius').length == 0) {
      var $slideMinRadius = $('<input type="hidden" id="min_radius" name="min_radius"\>');
      $(this).parents('form').append($slideMinRadius);
    }

    if ($(document).find('#max_radius').length == 0) {
      var $slideMaxRadius = $('<input type="hidden" id="max_radius" name="max_radius"\>');
      $(this).parents('form').append($slideMaxRadius);
    }
    var values = $(this).val().split(',');
    if (values.length > 1) {
      $(document).find('#min_radius').val(values[0]);
      $(document).find('#max_radius').val(values[1]);
    }else{
      $(document).find('#min_radius').val("0");
      $(document).find('#max_radius').val(values);
    }

  })
});
