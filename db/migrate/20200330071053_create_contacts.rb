class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.belongs_to :user
      t.belongs_to :contact,index: true, foreign_key: {to_table: :users}
      t.boolean :flag_favourite, default: false
      t.string :phone_number
      t.boolean :flag_active, default: true 
      t.timestamps
    end
  end
end
