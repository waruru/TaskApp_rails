class AddOmniauthToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid,      :string
    add_column :users, :name,     :string
    add_column :users, :token,    :string
  end
end
