function metricsGraph(canvasId) {
    var canvas = document.getElementById(canvasId);
    var ctx = canvas.getContext('2d');
    new Chart(ctx, {
        type: 'line',
        data: $(canvas).data('metrics')
    });
}

window.onload = function() {
    metricsGraph('client_strength');
    metricsGraph('client_anthropometry');
};
