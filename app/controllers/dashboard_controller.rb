class DashboardController < ApplicationController
  include UsersHelper
  before_action :require_login

  def index
  end

end
