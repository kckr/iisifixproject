$(function () {
  // Only applicable to Search Forms
  if ($('.the-flash').length == 0) return false;
  setTimeout(function () {
    $('.the-flash').fadeOut(3000, function () {
      $(this).remove()
    });
  }, 5000)
});
