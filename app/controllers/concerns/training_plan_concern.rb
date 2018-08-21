module TrainingPlanConcern
  extend ActiveSupport::Concern

  def name(training)
    name = Client.find_by(id: training.client_id).first_name + ' ' + Client.find_by(id: training.client_id).second_name
    name
  end

  def sets(training, current_user)
    sets = Kit.where(training_id: training.id, user_id: current_user.id).map do |kit|
      {
          :exercises => Exercise.where(kit_id: kit.id, user_id: current_user.id),
          :kit => kit
      }
    end
    sets.each do |kit|
      tmp_kit = kit[:exercises].map do |exe|
        { name: ExerciseType.find_by(id: exe.exercise_type_id).name, exe: exe }
      end
      kit[:exercises] = tmp_kit
    end
    sets
  end
end