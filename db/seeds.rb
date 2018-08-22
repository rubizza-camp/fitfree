# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
%w[Strength Anthropometry].each { |name| Kind.find_or_create_by(name: name) }
puts 'Created two kinds of metrics'
%w[Chest Basin Waist Neck Biceps Shin Hip].each do |name|
  Metric.find_or_create_by(name: name, units: 'sm', kind_id: 2)
end
puts 'Created anthropometry metrics'
%w[Sit-ups Pull-ups Push-ups].each do |name|
  Metric.find_or_create_by(name: name, units: 'repeats', kind_id: 1)
end
puts 'Created strength metrics'
