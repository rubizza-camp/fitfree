$(document).ready(function(){
    $('.ui.dropdown').dropdown({onChange(value, text, selItem) {
        join_clients(JSON.stringify(value));
    }});

    $('#training_date').calendar({
        type: 'date'
    });

    $('#start_time, #finish_time').calendar({
        ampm: false,
        type: 'time'
    });

    var clients = $('#clients_select').val();
    // join_clients(JSON.stringify(clients ? clients : []));
});

function join_clients(clients_ids) {
    var form_data = new FormData();
    form_data.append('clients', clients_ids);
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            document.getElementById("clients_continer").innerHTML = this.responseText;
        }
    };
    xhttp.open("POST", "/trainings/clients", true);
    xhttp.send(form_data);
}



function add_exercise() {
    $('.tiny.modal').modal('show');
}

// $(window).on('beforeunload', function() {
//     alert('123123123');
// });