class ApplicationController < ActionController::Base

  def force_onboarding
    redirect_to new_product_path unless current_user&.onboarded?
  end
end
