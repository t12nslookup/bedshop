# frozen_string_literal: true

class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops, id: false do |t|
      t.integer :shop_id, null: false, primary_key: true
      t.text :shop, null: false, index: true

      t.timestamps
    end
  end
end
