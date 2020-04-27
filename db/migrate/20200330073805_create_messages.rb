class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :sender, index: true, foreign_key: {to_table: :users}
      t.references :receiver, index: true, foreign_key: {to_table: :users}
      t.belongs_to :channel
      t.string :attachment
      t.string :read_at
      t.string :message_type
      t.string :body
      t.boolean :flag_active, default: true 
      t.timestamps
    end
  end
end
