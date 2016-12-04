class AddCpuUsageToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :cpu_usage, :integer
  end
end
