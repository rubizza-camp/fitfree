$(function () {
    $('#calendar').fullCalendar({
        themeSystem: 'bootstrap4',
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
        nowIndicator: true,
        slotDuration: "00:15",
        firstDay: 1,
        slotLabelFormat: 'HH:mm',
        selectable: true,
        selectHelper: true,
        editable: false,
        eventLimit: true,
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
});
