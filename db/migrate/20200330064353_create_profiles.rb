class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.belongs_to :user
      t.belongs_to :time_zone
      t.belongs_to :language
      t.string :profile_image_id
      t.string :latitude
      t.string :longitude
      t.string :location
      t.string :last_seen_at
      t.boolean :do_not_disturb, default: false
      t.boolean :location_enabled, default: false
      t.timestamps
    end
  end
end
