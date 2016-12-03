module Manager
  # BaseController class
  class BaseController < ApplicationController
    layout 'layouts/manager_layout'
    before_action :authorize!
  end
end
