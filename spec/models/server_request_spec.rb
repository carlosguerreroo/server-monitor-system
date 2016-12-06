require 'rails_helper'

RSpec.describe ServerRequest, type: :model do
  it { should respond_to :server_name }
  it { should respond_to :token }
  it { should respond_to :status }

  it { should belong_to :user }

  it { should validate_presence_of :server_name }
  it { should validate_presence_of :status }
  it { should validate_presence_of :user }
end
