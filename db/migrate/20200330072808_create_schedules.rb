class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.belongs_to :scheduler
      t.string :scheduler_with_ids, array: true, default: []
      t.string :schedulable_type
      t.string :date
      t.string :time
      t.string :description
      t.string :status
      t.boolean :flag_repeat, null: false
      t.boolean :flag_active, default: true 
      t.timestamps
    end
  end
end
