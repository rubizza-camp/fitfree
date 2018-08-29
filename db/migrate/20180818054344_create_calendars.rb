class CreateCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :calendars do |t|
      t.string :calendar_id
      t.string :code

      t.timestamps
    end
  end
end