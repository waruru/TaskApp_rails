class AddUniqueIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :unique_id, :string, default: "", limit: 10, null: false, after: :id
    add_index :users, :unique_id, unique: true
  end
end
