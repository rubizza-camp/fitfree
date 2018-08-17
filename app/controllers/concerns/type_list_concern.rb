module TypeListConcern
  extend ActiveSupport::Concern

  def types_list
    @types = []
    ExerciseType.all.each do |type|
      each = []
      each << type.name
      each << type.id
      @types << each
    end
    @types
  end
end
