class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string "name", null: false
      t.date "hold_date", null: false
      t.string "hold_place",null: false
      t.timestamps
    end
  end
end
