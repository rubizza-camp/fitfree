$(function () {
    var canvas = document.getElementById('client_metrics')
    var ctx = canvas.getContext('2d');
    var myLineChart = new Chart(ctx, {
        type: 'line',
        data: $(canvas).data('metrics')
    });
})
