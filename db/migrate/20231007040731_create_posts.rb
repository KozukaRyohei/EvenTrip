class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer "user_id", null:false
      t.string "event_id", null:false
      t.string "text", null:false
      t.timestamps
    end
  end
end
