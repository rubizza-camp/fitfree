class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :text, default: '', null:false
      t.string :update_id, default: '', null:false
      t.integer :status, default: 0
      t.references :messagable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
