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

  private

  def recipient_params
    params.require(:recipient).permit(:first_name, :last_name, :email)
  end
end
