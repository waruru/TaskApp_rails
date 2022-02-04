class CreateTaskLists < ActiveRecord::Migration[6.1]
  def change
    create_table :task_lists do |t|
      t.string :name, null: false, default: ""
      t.references :board, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
