class CreateWorkspaceJoinRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :workspace_join_requests do |t|
      t.references :workspace, null: false, foreign_key: { on_delete: :cascade }
      t.references :request_sender, null: false, foreign_key: { on_delete: :cascade, to_table: :users }
      t.references :request_recipient, null: false, foreign_key: { on_delete: :cascade, to_table: :users }

      t.timestamps
    end
    add_index :workspace_join_requests, [:workspace_id, :request_sender_id, :request_recipient_id], unique: true, name: "index_unique_workspace_join_request"
  end
end
