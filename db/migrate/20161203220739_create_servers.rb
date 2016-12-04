class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name
      t.integer :status
      t.datetime :last_connection
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
