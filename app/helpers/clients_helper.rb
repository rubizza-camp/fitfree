module ClientsHelper
  def client_metrics_data(client, snapshots, kind_id)
    {
      labels: client_labels(snapshots),
      datasets: client_data_sets(client, snapshots,kind_id)
    }.to_json
  end

  def client_labels(snapshots)
    snapshots.map(&:date)
  end

  def client_data_sets(client, snapshots, kind_id)
    snapshots.
      map(&:measurements).
      flatten.
      group_by(&:metric).
      select { |metric, _measurements| metric.kind_id == kind_id }.
      map do |metric, measurements|
        client_data_set(metric, measurements)
      end
  end

  def client_data_set(metric, measurements)
    {
      label: metric.name,
      backgroundColor: color,
      borderColor: color,
      fill: false,
      data: measurements.map(&:value),
    }
  end

  def color
    [:red, :yellow, :blue, :green, :pink, :orange, :violet, :blood, :gold].sample
  end
end
