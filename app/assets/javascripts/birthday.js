function birthday_notification(indata) {
    if (indata != "[]")
    {
        var clients_array = JSON.parse(indata.replace(/&quot;/g, '"'));
        var element_list = document.createElement("div");
        for (i = 0; i < clients_array.length; i++) {
            var tmp_element = document.createElement("a");
            tmp_element.href = "/clients/" + clients_array[i].id;
            tmp_element.innerText = clients_array[i].first_name + " " + clients_array[i].second_name;
            element_list.appendChild(tmp_element);
            element_list.appendChild(document.createElement("br"));
        }
        swal("Сегодня день рождение", {
            content: element_list,
        });
    }
}