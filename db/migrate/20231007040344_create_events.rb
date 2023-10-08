class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string "name", null: false
      t.string "hold_year", null: false
      t.string "hold_month", null: false
      t.string "hold_day", null: false
      t.string "hold_place",null: false
      t.timestamps
    end
  end
end
