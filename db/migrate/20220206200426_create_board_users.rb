class CreateBoardUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :board_users do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.references :board, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
    add_index :board_users, [:user_id, :board_id], unique: true
  end
end
