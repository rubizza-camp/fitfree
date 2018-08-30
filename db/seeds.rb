# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin_password = Rails.application.secrets[:admin_password].to_s
%w[Strength Anthropometry].each { |name| Kind.find_or_create_by(name: name) }
puts 'Created two kinds of metrics'
%w[Грудь Таз Талия Шея Бицепс Голень Бедро].each do |name|
  Metric.find_or_create_by(name: name, units: 'см', kind_id: 2)
end
puts 'Created anthropometry metrics'
%w[Приседания Подтягивания].each do |name|
  Metric.find_or_create_by(name: name, units: 'повторы', kind_id: 1)
end
Metric.create(name: 'Жим штанги лёжа', units: 'повторы', kind_id: 1)
Metric.create(name: 'Становая тяга', units: 'повторы', kind_id: 1)
puts 'Created strength metrics'
superadmin = Administrator.create(email: 'superadmin@gmail.com',
                                  password: admin_password,
             password_confirmation: admin_password, superadmin: true)
puts 'Create super admin: ' << superadmin.email
admin = Administrator.create(email: 'admin@gmail.com', password: admin_password,
             password_confirmation: admin_password, superadmin: false)
puts 'Create admin: ' << admin.email
Administrator.all.update_all confirmed_at: DateTime.now
puts 'Administrators were confirmed'
