//= require jquery
//= require jquery.smartresize

(function (window, $) {
  'use strict';

  $(function () {
    var $window        = $(window),
        $newsContainer = $('#news-container'),
        $footer        = $('.footer'),
        offset         = $newsContainer.offset().top,
        height         = $window.height() - offset - $footer.height(),
        width          = $newsContainer.width();

    $window.smartresize(function () {
      $('#news-frame').height(height).width(width);
    }).resize();
  });
})(window, jQuery);
