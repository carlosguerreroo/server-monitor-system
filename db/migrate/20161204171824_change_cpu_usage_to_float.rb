class ChangeCpuUsageToFloat < ActiveRecord::Migration
  def change
    change_column :activities, :cpu_usage, :float
  end
end
