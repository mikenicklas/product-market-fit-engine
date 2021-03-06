class SurveyResponsesController < ApplicationController
  before_action :set_recipient

  def new
    @survey_response = @recipient.survey_responses.new
  end

  def create
    @survey_response = @recipient.survey_responses.new(survey_params)
    if @survey_response.save
      @recipient.update(completed_survey_at: Time.zone.now)
      UpdateWordCloudService.call(product: @recipient.product)
      redirect_to survey_response_thanks_path(token: params[:token])
    else
      render :new, flash: { error: "Sorry your survey response could not be processed." }
    end
  end

  private

  def set_recipient
    @recipient = Recipient.find_by(survey_token: params[:token])
  end

  def survey_params
    params.require(:survey_response).permit(:disappointment, :main_benefits,
      :ideal_customer, :recommended_improvements).merge!(product_id: @recipient.product.id)
  end
end
