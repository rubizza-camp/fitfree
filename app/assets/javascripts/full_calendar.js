$(function () {
    $('#calendar').fullCalendar({
        themeSystem: 'bootstrap4',
        googleCalendarApiKey: 'AIzaSyD_EW8Jfd7NQWpF7QCQbNXdxViQOv1vTRo',
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
        events: 'k9qatn9fshgu56rhtccrec0dao@group.calendar.google.com',
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

