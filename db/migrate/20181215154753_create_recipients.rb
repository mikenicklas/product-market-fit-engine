class CreateRecipients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipients do |t|
      t.integer :product_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.jsonb :custom_data
      t.datetime :sent_survey_at
      t.datetime :completed_survey_at

      t.timestamps
    end
  end
end
