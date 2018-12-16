class FixIdealCustomerColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :survey_responses, :ideal_customer, :text
  end
end
