class CreateDiskReports < ActiveRecord::Migration
  def change
    create_table :disk_reports do |t|
      t.integer :total
      t.integer :used
      t.references :server, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
