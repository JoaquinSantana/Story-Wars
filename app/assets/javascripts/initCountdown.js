$(document).ready(function() {
    var clock = $('#clock');
    // init jquery.countdown
    clock.countdown(clock.data("time")).on('update.countdown', function(event) {
        var $this = $(this).html(event.strftime('<span>%M</span> min'));
    }); 
});