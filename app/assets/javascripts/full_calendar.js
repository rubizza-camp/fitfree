$(function () {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            locale = this.responseText;
            calendar(locale)
        }
    };
    xhttp.open("GET", "/locale", true);
    xhttp.send(new FormData());
});

var calendar = function(locale){
    $('#calendar').fullCalendar({
        locale: locale,
        header: {
            left: 'title',
            center: '',
            right: 'prev,next, today, month,agendaWeek,agendaThreeDay,agendaDay'
        },
        views: {
            agendaThreeDay: {
                type: 'agenda',
                duration: { days: 3 },
                buttonText: '3 days(дня)'
            }
        },
        defaultView: 'agendaThreeDay',
        nowIndicator: true,
        slotDuration: "00:15",
        selectable: true,
        selectHelper: true,
        editable: false,
        eventLimit: true,
        eventSources: ['/download'],
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
};

