// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require popper
//= require bootstrap-sprockets
//= require moment
////= require fullcalendar

////= require select2/dist/js/select2.full.js
//= require select2
//= require chart.js/dist/Chart.js
////= require_tree .
//= require cable

//= require semantic-ui
//= require semantic-ui/modal
//= require semantic-ui/dropdown

// config.action_cable.mount_path = '/messages';

$(document).ready(function() {
    $('#toc')
        .sidebar({
            dimPage          : true,
            transition       : 'overlay',
            mobileTransition : 'uncover'
        }).sidebar('attach events', '.menu .item');
    // check_window_size()
});

// $(window).resize(check_window_size);

// function check_window_size() {
//     if($(window).width() > 1199) {
//         // $('.ui.sidebar').sidebar({
//         //     context: $('.bottom.segment')
//         // }).sidebar('show');
//         $('.toc').css('display', 'flex');
//         $('.attached.menu').css("display", "none")
//     } else {
//         $('.toc').css('display', 'none');
//         // $('.ui.sidebar').sidebar({context: '.bottom.segment'});
//         $('.attached.menu').css("display", "flex")
//     }
// }


