// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

// Libraries Via Gem
//= require jquery
//= require jquery_ujs
//= require bootstrap

//= require pickadate/picker
//= require pickadate/picker.date
//= require pickadate/picker.time

//= require common/jquery.magnific-popup.min
//= require bootbox

// Vendor scripts
//= require static/bootstrap-slider.min
//= require_tree ../../../vendor/assets/javascripts/common/.
//= require application/app
//= require application/jquery.slimscroll.min
//= require application/app.plugin
// --------------------------------------------------------------------
// Custom Code area
//= require config/general_config
//= require config/validator_config

//= require application/search_form
//= require_tree ./application/garage_owners/
//= require_tree ./application/vehicle_owners/

//= require ./common_to_all_layouts/hide_flash
//= require ./common_to_all_layouts/popup_options
//= require ./common_to_all_layouts/zopin_live_chat
