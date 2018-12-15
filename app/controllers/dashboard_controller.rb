class DashboardController < ApplicationController
  before_action :authenticate_user!, :force_onboarding

  def index
  end

end
