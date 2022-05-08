class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :name, null: false, default: ""
      t.string :color, null: false, default: "#4ade80"

      t.references :workspace, null: false, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
