class RecipientMailer < ApplicationMailer

  def survey_email
    @recipient = params[:recipient]
    mail(to: @recipient.email, from: @recipient.product.public_contact_email,
      subject: "Quick question about #{@recipient.product.name}")
  end
end
