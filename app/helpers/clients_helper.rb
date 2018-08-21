module ClientsHelper
  def client_metrics_data(client, snapshots, kind)
    {
<<<<<<< HEAD
      labels: client_labels(snapshots),
      datasets: client_data_sets(client, snapshots, kind)
=======
      labels:   client_labels(snapshots),
      datasets: client_data_sets(client, snapshots, kind_id)
>>>>>>> Refactor project
    }.to_json
  end

  def client_labels(snapshots)
    snapshots.map(&:date)
  end

<<<<<<< HEAD
  def client_data_sets(client, snapshots, kind)
=======
  def client_data_sets(_client, snapshots, kind_id)
>>>>>>> Refactor project
    snapshots
      .map(&:measurements)
      .flatten
      .group_by(&:metric)
<<<<<<< HEAD
      .select { |metric, _measurements| metric.kind_id == kind.id }
      .map { |metric, measurements| client_data_set(metric, measurements) }
=======
      .select { |metric, _measurements| metric.kind_id == kind_id }
      .map do |metric, measurements|
        client_data_set(metric, measurements)
      end
>>>>>>> Refactor project
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
