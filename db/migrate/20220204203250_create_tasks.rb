class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false, default: ""
      t.text :memo
      t.references :task_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
