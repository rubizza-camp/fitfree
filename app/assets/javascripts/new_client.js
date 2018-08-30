$(document).ready(function(){
    $('#metrics_select' ).dropdown({onChange(value, text, selItem) {

        }});

    $('.ui.dropdown').dropdown();

    $('#birth_date').calendar({
        type: 'date'
    });
});
