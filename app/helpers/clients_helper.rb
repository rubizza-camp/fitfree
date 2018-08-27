module ClientsHelper
  def client_metrics_data(client, snapshots, kind)
    {
      labels: client_labels(snapshots),
      datasets: client_data_sets(client, snapshots, kind)
    }.to_json
  end

  def client_labels(snapshots)
    snapshots.map(&:date)
  end

  def client_data_sets(client, snapshots, kind)
    snapshots
      .map(&:measurements)
      .flatten
      .group_by(&:metric)
      .select { |metric, _measurements| metric.kind_id == kind.id }
      .map { |metric, measurements| client_data_set(metric, measurements) }
  end

  def client_data_set(metric, measurements)
    {
      label:           metric.name,
      backgroundColor: color,
      borderColor:     color,
      fill:            false,
      data:            measurements.map(&:value)
    }
  end

  def color
    %i[red yellow blue green pink orange violet blood gold].sample
  end
end
