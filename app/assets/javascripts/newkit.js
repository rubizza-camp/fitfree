function newkit() {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("newkit").innerHTML += this.responseText;
        }
    };
    xhttp.open("GET", "/kits/new", true);
    xhttp.send(new FormData());
}

function cancel(id) {
    var xhttp = new XMLHttpRequest();
    document.getElementById('edit_training_' + id).submit();
    xhttp.open("PUT", "/trainings/cancel/" + id, true);
    xhttp.send(new FormData());

}
