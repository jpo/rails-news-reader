(function(document, $) {
  'use strict';

  var setup = function(el) {
    var $control = el,
        type     = $control.data('method');

    if (type === 'select') {
      var $select  = $control.find('select'),
          selected = $select.val() !== '';
      $control.toggleClass('selected', selected);
    }

    if (type === 'toggle') {
      var $icon  = $control.find('i');
      var $input = $control.find('input');
      var value  = $input.val() === 't' || $input.val() === 'true';
      $control.toggleClass('selected', value);
      $icon.toggleClass('icon-check', value);
      $icon.toggleClass('icon-check-empty', !value);
    }
  };

  var toggleSelect = function(e) {
    var $control = $(this),
        $select  = $control.find('select'),
        selected = $select.val() !== '';

    $control.toggleClass('selected', selected);
    e.preventDefault();
  };

  var toggleCheckbox = function(e) {
    var $control = $(this),
        $icon    = $control.find('i'),
        $input   = $control.find('input'),
        oldValue = $input.val() === 't' || $input.val() === 'true',
        newValue = !oldValue;

    $control.toggleClass('selected', newValue);
    $icon.toggleClass('icon-check', newValue);
    $icon.toggleClass('icon-check-empty', !newValue);
    $input.val(newValue ? 'true' : 'false');
    e.preventDefault();
  };

  $(document).on('change', '.preference-control[data-method=select]', toggleSelect);
  $(document).on('click',  '.preference-control[data-method=toggle]', toggleCheckbox);
  $('.preference-control').each(function(i, el) { setup($(el)); });
}(document, jQuery));
