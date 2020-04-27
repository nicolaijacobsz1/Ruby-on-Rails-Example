class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.belongs_to :user
      t.string :notifiable_id
      t.string :notifiable_type
      t.string :title
      t.string :body
      t.boolean :flag_read, null: false
      t.timestamps
    end
  end
end
