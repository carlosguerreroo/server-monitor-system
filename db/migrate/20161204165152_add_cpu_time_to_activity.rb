class AddCpuTimeToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :cpu_time, :integer
  end
end
