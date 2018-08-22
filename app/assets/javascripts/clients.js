$(function () {
    $('canvas[data-chart]').each(function (index, canvas) {
        metricsGraph(canvas)
    });
});

function metricsGraph(canvas) {
    var ctx = canvas.getContext('2d');
    new Chart(ctx, {
        type: 'line',
        data: $(canvas).data('metrics')
    });
}
