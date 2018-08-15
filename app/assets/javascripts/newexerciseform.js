function newexercise(id) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("exercise_" + id).innerHTML += this.responseText;
        }
    };
    xhttp.open("POST", "/newexerciseform", true);
    xhttp.send(new FormData());
}