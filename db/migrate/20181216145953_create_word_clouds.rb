class CreateWordClouds < ActiveRecord::Migration[5.2]
  def change
    create_table :word_clouds do |t|
      t.integer :product_id
      t.jsonb :words, default: {}

      t.timestamps
    end
  end
end
