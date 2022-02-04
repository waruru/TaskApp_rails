class CreateWorkspaces < ActiveRecord::Migration[6.1]
  def change
    create_table :workspaces do |t|
      t.string :name, null: false, default: ""

      t.timestamps
    end
  end
end
