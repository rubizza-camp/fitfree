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
        header: {
            left: 'prev,next, today',
            center: 'title',
            right: 'month,agendaWeek,agendaThreeDay,agendaDay'
        },
        views: {
            agendaThreeDay: {
                type: 'agenda',
                duration: { days: 3 },
                buttonText: '3 day'
            }
        },
        defaultView: 'agendaThreeDay',
        firstDay: 1,
        selectable: true,
        selectHelper: true,
        editable: true,
        eventLimit: true,
        events: resp_json
    });
}
