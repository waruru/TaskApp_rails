class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :name, null: false, default: ""

      t.references :workspaces, foreign_key: true
      t.timestamps
    end
  end
end
