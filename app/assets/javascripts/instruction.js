function instruction() {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("instruction").innerHTML = '<p></p>' + this.responseText;
        }
    };
    xhttp.open("GET", "/instruction", true);
    xhttp.send(new FormData());
}

function refresh() {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("instruction").innerHTML = '';
        }
    };
    xhttp.open("GET", "/instruction", true);
    xhttp.send(new FormData());
}