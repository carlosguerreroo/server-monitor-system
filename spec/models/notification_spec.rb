require 'rails_helper'

RSpec.describe Notification, type: :model do
  it { should respond_to :name }
  it { should respond_to :notification_type }
  it { should respond_to :status }

  it { should belong_to :server }

  it { should validate_presence_of :name }
  it { should validate_presence_of :notification_type }
  it { should validate_presence_of :status }
  it { should validate_presence_of :server }
end
