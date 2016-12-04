class CreateServerRequests < ActiveRecord::Migration
  def change
    create_table :server_requests do |t|
      t.string :server_name
      t.string :token
      t.integer :status
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
