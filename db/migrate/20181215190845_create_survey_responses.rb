class CreateSurveyResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_responses do |t|
      t.integer :recipient_id
      t.integer :product_id
      t.integer :disappointment
      t.integer :ideal_customer
      t.text :main_benefits
      t.text :recommended_improvements

      t.timestamps
    end
  end
end
