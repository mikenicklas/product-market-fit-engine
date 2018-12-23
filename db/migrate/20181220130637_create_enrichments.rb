class CreateEnrichments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrichments do |t|
      t.string :recipient_id
      t.string :product_id
      t.jsonb :data

      t.timestamps
    end
  end
end
