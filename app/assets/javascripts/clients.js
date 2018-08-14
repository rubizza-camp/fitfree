$(function () {
    var canvas = document.getElementById('client_strength')
    var ctx = canvas.getContext('2d');
    var myLineChart = new Chart(ctx, {
        type: 'line',
        data: $(canvas).data('metrics')
    });
})
$(function () {
    var canvas = document.getElementById('client_anthropometry')
    var ctx = canvas.getContext('2d');
    var myLineChart = new Chart(ctx, {
        type: 'line',
        data: $(canvas).data('metrics')
    });
})
