$(document).ready(function() {

  $('#toggle').click(function() {
    $(this).toggleClass('active');
    $('#overlay').toggleClass('open');
  });

  // hide menu on ESC keyboard hit
  $(document).on('keydown', function(e) {
    if (e.keyCode === 27) { // ESC
      $("#toggle").removeClass('active');
      $('#overlay').removeClass('open');
    }
  });
});
