class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.references :creator, index: true, foreign_key: {to_table: :users}
      t.string :member_ids, array: true, default: []
      t.boolean :flag_active, default: true 
      t.timestamps
    end
  end
end
