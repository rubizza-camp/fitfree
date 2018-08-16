module MetricsHelper
  def metric_name_with_units(metric)
    "#{metric.name} (#{metric.units})"
  end
end
