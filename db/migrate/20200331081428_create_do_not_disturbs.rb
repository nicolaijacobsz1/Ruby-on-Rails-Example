class CreateDoNotDisturbs < ActiveRecord::Migration[5.2]
  def change
    create_table :do_not_disturbs do |t|
      t.belongs_to :user
      t.belongs_to :time_zone
      t.string :from_time
      t.string :to_time
      t.string :days, array: true, default: []
      t.boolean :is_active
      t.timestamps
    end
  end
end