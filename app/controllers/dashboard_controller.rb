class DashboardController < BaseController

  def index
    @survey_responses = current_product.survey_responses&.group_by(&:disappointment)
  end

end
