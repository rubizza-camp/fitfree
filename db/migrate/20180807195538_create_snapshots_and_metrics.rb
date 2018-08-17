class CreateSnapshotsAndMetrics < ActiveRecord::Migration[5.2]
  def change
    create_table :snapshots do |t|
      t.date :date, null: false
      t.belongs_to :client
      t.timestamps
    end

    create_table :metrics do |t|
      t.string :name, null: false
      t.string :units, null: false
      t.integer :kind_id
      t.timestamps
    end

    create_table :measurements do |t|
      t.belongs_to :snapshot
      t.belongs_to :metric
      t.decimal :value
    end

    create_join_table :metrics, :clients
  end
end
