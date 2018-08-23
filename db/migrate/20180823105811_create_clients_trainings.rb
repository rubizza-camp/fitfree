class CreateClientsTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :clients_trainings, :id => false do |t|
      t.belongs_to :trainigs, index: true
      t.belongs_to :clients, index: true
    end
  end
end
