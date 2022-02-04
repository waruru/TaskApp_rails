class CreateWorkspaceUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :workspace_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :workspace, null: false, foreign_key: true

      t.timestamps
    end
  end
end
