class AddUserGuest < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :guest, :boolean, default: false, null: false
  end
end
