class CreateCalls < ActiveRecord::Migration[5.2]
  def change
    create_table :calls do |t|
      t.references :caller, index: true, foreign_key: {to_table: :users}
      t.references :call_receiver, index: true, foreign_key: {to_table: :users}
      t.string :call_type
      t.string :start_time
      t.string :end_time
      t.boolean :flag_answer, null: false
      t.timestamps
    end
  end
end
