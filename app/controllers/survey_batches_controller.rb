class SurveyBatchesController < BaseController

  def create
    if recipients_to_send_to.any?
      SendSurveyBatch.call(recipients: recipients_to_send_to)
      redirect_to recipients_path, flash: { success: "Your surveys will be sent shortly!" }
    else
      redirect_to recipients_path
    end
  end

  private

  # TODO: ugly
  def recipients_to_send_to
    @recipients_to_send_to ||= begin
      if params[:send_survey_ids].present?
        params[:send_survey_ids].split(',').map(&:to_i)
      else
        []
      end
    end
  end

end
