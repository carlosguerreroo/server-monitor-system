require 'rails_helper'

RSpec.describe User, type: :model do
  it { should respond_to :username }

  it { should have_many :session_tokens }
  it { should have_many :servers }
  it { should have_many :process_reports }
  it { should have_many :server_requests }

  it { should validate_uniqueness_of :username }
  it { should validate_presence_of :username }
end
