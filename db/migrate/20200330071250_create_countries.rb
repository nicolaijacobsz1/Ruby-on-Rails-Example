class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.belongs_to :time_zone
      t.string :name
      t.boolean :flag_active, default: true 
      t.timestamps
    end
  end
end
