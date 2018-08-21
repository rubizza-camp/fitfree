window.onload = function () {
    if (document.getElementById('calendar') != null) {
      var json = $.getJSON( "download", function(result){
       calendar(json)
   });
    }
    else {
        metricsGraph('client_strength');
        metricsGraph('client_anthropometry');
    }
};

function metricsGraph(canvasId) {
    var canvas = document.getElementById(canvasId);
    var ctx = canvas.getContext('2d');
    new Chart(ctx, {
        type: 'line',
        data: $(canvas).data('metrics')
    });
}

function calendar(json) {
    var resp_json = $.parseJSON(json.responseText);
    $('#calendar').fullCalendar({
        /*themeSystem: 'bootstrap4',*/
        header: {
            left: 'prev,next, today',
            center: 'title',
            right: 'month,agendaWeek,agendaThreeDay,agendaDay'
        },
        views: {
            agendaThreeDay: {
                type: 'agenda',
                duration: { days: 3 },
                buttonText: '3 days'
            }
        },
        defaultView: 'agendaThreeDay',
        firstDay: 1,
        slotLabelFormat: 'HH:mm',
        selectable: true,
        selectHelper: true,
        editable: false,
        eventLimit: true,
        events: resp_json,
        timeFormat: 'HH:mm',
        aspectRatio: 1.8,
        dayClick: function (date) {
            window.location.href = "/trainings/new/" + date.format();
            $(this).fullCalendar('unselect');
        },
        eventClick: function(calEvent) {
            window.location.href = "/trainings/" + calEvent.id;
            $(this).fullCalendar('unselect');
        },
    });
}
