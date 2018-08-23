class CreateClientsTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :clients_trainings, :id => false do |t|
      t.belongs_to :training, index: true
      t.belongs_to :client, index: true
    end
  end
end
