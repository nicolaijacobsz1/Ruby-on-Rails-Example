class CreateTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :times do |t|
      t.time :time
      t.timestamps
    end
  end
end
