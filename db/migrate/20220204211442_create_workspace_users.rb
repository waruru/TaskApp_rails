class CreateWorkspaceUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :workspace_users do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.references :workspace, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
    add_index :workspace_users, [:user_id, :workspace_id], unique: true
  end
end
