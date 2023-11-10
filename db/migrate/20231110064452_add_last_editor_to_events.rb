class AddLastEditorToEvents < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :last_editor, foreign_key: { to_table: :users }
  end
end
