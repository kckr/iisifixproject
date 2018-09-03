$(document).ready(function () {
  if ($('#garageServices').length == 0) return false;

  $('#addService').click(function (e) {
    e.preventDefault();
    // Add new form item
    var $clone = $('.additionalServiceDetail').last().clone();
    var randomId = Math.floor(Math.random() * 1000000000);
    makeCopy($clone, 'name', randomId);
    makeCopy($clone, 'description', randomId);
    makeCopy($clone, 'category_id', randomId);

    $clone.appendTo($('#additionalServiceDetailContainer'));
  });

  function makeCopy(clone, item_name, randomId){
    var new_name = 'garage[created_services_attributes][' + randomId + ']['+item_name+']';
    clone.find('.service-'+item_name).attr('name', new_name);
    clone.find('.service-'+item_name).val('');
  }

});
