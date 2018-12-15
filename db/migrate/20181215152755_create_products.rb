class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :user_id
      t.string :logo_url
      t.string :name
      t.string :site_url
      t.string :public_contact_email

      t.timestamps
    end
  end
end
