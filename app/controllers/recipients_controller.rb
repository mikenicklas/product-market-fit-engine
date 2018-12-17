class RecipientsController < BaseController

  def new
    @recipient = current_product.recipients.new
  end

  def create
    @recipient = current_product.recipients.new(recipient_params)
    if @recipient.save
      redirect_to root_path, flash: { success: "Your recipient was successfully added!" }
    else
      render :new, flash: { error: "Your recipient could not be created." }
    end
  end

  def index
    @recipients = current_product.recipients.as_json(only: [:id, :first_name, :last_name, :email],
      methods: [:status], include: {survey_responses: { only: [:disappointment, :main_benefits, :recommended_improvements, :ideal_customer] }}).to_json
  end

  private

  def recipient_params
    params.require(:recipient).permit(:first_name, :last_name, :email)
  end
end
