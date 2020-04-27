class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :password, :encrypted_password
  end
end