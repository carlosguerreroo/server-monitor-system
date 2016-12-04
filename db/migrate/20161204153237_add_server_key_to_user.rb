class AddServerKeyToUser < ActiveRecord::Migration
  def change
    add_column :users, :server_key, :string
  end
end
