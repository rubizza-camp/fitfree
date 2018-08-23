window.onload = function () {
    if (document.getElementById('calendar') != null) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                calendar(this.responseText);
            }
        };
        xhttp.open("GET", "/calendar_id", true);
        xhttp.send(new FormData());
    }
    else {
        $('canvas[data-chart]').each(function (index, canvas) {
            metricsGraph(canvas)
        });
    }
};

function metricsGraph(canvas) {
    var ctx = canvas.getContext('2d');
    new Chart(ctx, {
        type: 'line',
        data: $(canvas).data('metrics')
    });
}

function calendar(id) {
    $('#calendar').fullCalendar({
        themeSystem: 'bootstrap4',
        googleCalendarApiKey: 'AIzaSyBg-nLVg7YOcMlr6cte3RH3U2c-t1G2m3A',
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
        events: id,
        eventSources: ['/download'],
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
