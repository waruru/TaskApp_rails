class CreateTaskLists < ActiveRecord::Migration[6.1]
  def change
    create_table :task_lists do |t|
      t.string :name, null: false, default: ""
      t.references :board, foreign_key: true

      t.timestamps
    end
  end
end