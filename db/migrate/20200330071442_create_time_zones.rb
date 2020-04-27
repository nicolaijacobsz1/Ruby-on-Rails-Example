class CreateTimeZones < ActiveRecord::Migration[5.2]
  def change
    create_table :time_zones do |t|
    t.string :time_offset
    t.string :location
    t.boolean :flag_active, default: true 
    t.timestamps
    end
  end
end
