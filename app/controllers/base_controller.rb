class BaseController < ApplicationController
  before_action :authenticate_user!, :force_onboarding

  helper_method :current_product

  def force_onboarding
    redirect_to new_product_path unless current_user&.onboarded?
  end

  def current_product
    current_user&.product
  end
end
