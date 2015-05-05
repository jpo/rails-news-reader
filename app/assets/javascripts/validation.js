//= require jquery.validate

(function($) {
  'use strict';

  if ($.fn.validate)
    $('form.validate').validate({errorClass: 'text-error'});
}(jQuery));
