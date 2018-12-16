class AddIndexedToSurveyResponses < ActiveRecord::Migration[5.2]
  def change
    add_column :survey_responses, :indexed, :boolean, default: false
  end
end
