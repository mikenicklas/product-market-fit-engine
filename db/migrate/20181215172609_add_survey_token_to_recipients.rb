class AddSurveyTokenToRecipients < ActiveRecord::Migration[5.2]
  def change
    add_column :recipients, :survey_token, :string, index: true
  end
end
