class CreateWorkspaces < ActiveRecord::Migration[6.1]
  def change
    create_table :workspaces do |t|
      t.string :name, null: false, default: ""
      t.string :color, null: false, default: "#4ade80"

      t.timestamps
    end
  end
end
