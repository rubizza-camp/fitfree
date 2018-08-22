$(function () {
  var json = $.getJSON( "download", function(result) {
      calendar(json)
  });
});

function calendar(json) {
    var resp_json = $.parseJSON(json.responseText);
    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next, today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        selectable: true,
        selectHelper: true,
        editable: true,
        eventLimit: true,
        events: resp_json
    });
}
