class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :name
      t.integer :notification_type
      t.integer :status
      t.references :server, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
