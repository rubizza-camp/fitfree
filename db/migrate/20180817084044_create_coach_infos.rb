class CreateCoachInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :coach_infos do |t|
      t.belongs_to :user, index: true
      t.datetime :birthdate
      t.string :region, default: '', null: false
      t.string :town, default: '', null: false
      t.string :phone, default: '', null: false
      t.string :facebook_sn, default: '', null: false
      t.string :instagram_sn, default: '', null: false
      t.string :vk_sn, default: '', null: false
      t.timestamps
    end
  end
end
