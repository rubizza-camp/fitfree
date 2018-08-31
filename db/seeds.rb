# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
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
ExerciseType.create(name: 'Bench press with chest standing', description: '')
ExerciseType.create(name: 'Press of dumbbells', description: '')
ExerciseType.create(name: 'Mahi dumbbells in the sides', description: '')
ExerciseType.create(name: 'Pulling the head with a wide grip', description: '')
ExerciseType.create(name: 'Push-ups from the floor with a wide grip', description: '')
ExerciseType.create(name: 'Pressing dumbbells at an angle of 30-40 °', description: '')
ExerciseType.create(name: 'Press the rod at an angle of 30-40 °', description: '')
ExerciseType.create(name: 'Hyperextension', description: '')
ExerciseType.create(name: 'Deadlift on straight legs', description: '')
ExerciseType.create(name: 'Static draft with dumbbells', description: '')
ExerciseType.create(name: 'Pulling up to the chest with a wide grip', description: '')
ExerciseType.create(name: 'Thrust of horizontal block', description: '')
ExerciseType.create(name: 'Thrust T-neck in slope', description: '')
ExerciseType.create(name: 'Pulling in a Smith machine', description: '')
ExerciseType.create(name: 'Thrust from the upper block with a narrow handle', description: '')
ExerciseType.create(name: 'Pull-ups', description: '')
ExerciseType.create(name: 'Bending of arms with a standing post', description: '')
ExerciseType.create(name: 'Bending of hands with dumbbells', description: '')
ExerciseType.create(name: 'Push-ups from the beams on the triceps', description: '')
ExerciseType.create(name: 'Push-ups with a narrow grip from the floor', description: '')
ExerciseType.create(name: 'Press bar with a narrow grip', description: '')
ExerciseType.create(name: 'Flexion of the wrists with the bar sitting', description: '')
ExerciseType.create(name: 'Extension of hands with a bar sitting', description: '')
ExerciseType.create(name: 'Lifting the legs in the vise', description: '')
ExerciseType.create(name: 'Lifting the legs on an incline bench', description: '')
ExerciseType.create(name: 'Twisting on an incline bench', description: '')
ExerciseType.create(name: 'Twisting in a Roman chair', description: '')
ExerciseType.create(name: 'Squats', description: '')
ExerciseType.create(name: 'Impacts with a barbell', description: '')
ExerciseType.create(name: 'Dumbbells with dumbbells', description: '')
ExerciseType.create(name: 'Standing rod standing on a stand', description: '')
ExerciseType.create(name: 'Squats', description: '')
ExerciseType.create(name: 'Squats with a barbell on the chest', description: '')
ExerciseType.create(name: 'Pressing your feet in the machine', description: '')
ExerciseType.create(name: 'Deadlift on straight legs', description: '')
ExerciseType.create(name: 'Leg bending in the machine', description: '')
ExerciseType.create(name: 'Side Effects', description: '')
ExerciseType.create(name: 'Bringing the hip in a crossover', description: '')
ExerciseType.create(name: 'Ascent to the socks in a standing machine', description: '')
ExerciseType.create(name: 'Ascent to the socks in a sitting simulator', description: '')

superadmin = Administrator.create(email: 'superadmin@gmail.com',
                                  password: admin_password,
             password_confirmation: admin_password, superadmin: true)
puts 'Create super admin: ' << superadmin.email

admin = Administrator.create(email: 'admin@gmail.com', password: admin_password,
             password_confirmation: admin_password, superadmin: false)
puts 'Create admin: ' << admin.email
Administrator.all.update_all confirmed_at: DateTime.now
puts 'Administrators were confirmed'
