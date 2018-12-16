class DashboardController < BaseController

  def index
    @survey_responses = current_product.survey_responses&.group_by(&:disappointment)
    @word_cloud = current_product.word_cloud&.words
  end

end
