class CreateHashPostRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :hash_post_relations do |t|
      t.references :post, index: true, foreign_key: true
      t.references :hashtag, index: true, foreign_key: true
      t.timestamps
    end
  end
end
