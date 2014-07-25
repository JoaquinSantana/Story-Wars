$(document).ready(function() {
    var clock = $('#clock');
    // init jquery.countdown
    console.log("clock");
    clock.countdown(clock.data("time")).on('update.countdown', function(event) {
        console.log("countdown");
        var $this = $(this).html(event.strftime('<span>%M</span> min'));
    }); 
});