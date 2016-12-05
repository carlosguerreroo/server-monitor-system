class AddTokenToServer < ActiveRecord::Migration
  def change
    add_column :servers, :token, :string
  end
end
