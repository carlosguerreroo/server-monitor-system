class CreateProcessReports < ActiveRecord::Migration
  def change
    create_table :process_reports do |t|
      t.references :server, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
