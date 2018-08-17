function newexercise(id) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("kit_" + id).innerHTML += this.responseText;
        }
    };
    xhttp.open("GET", "/exercise/new/" + id, true);
    xhttp.send(new FormData());
}


function save_and_show(id, ex_id) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("exercise_" + id).innerHTML = this.responseText;
        }
    };
    xhttp.open("PUT", "/exercises/" + ex_id, true);
    xhttp.send(new FormData(document.getElementById('edit_exercise_' + ex_id)));
}



