# Process Report Model Class
# server_id:integer
class ProcessReport < ActiveRecord::Base
  belongs_to :server

  has_many :activities

  validates :server, presence: true

  def total_cpu_usage
    activities.sum(:cpu_usage)
  end
end
