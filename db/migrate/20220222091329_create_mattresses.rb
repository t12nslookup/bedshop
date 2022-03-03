# frozen_string_literal: true

class CreateMattresses < ActiveRecord::Migration[6.0]
  def change
    create_table :mattresses do |t|
      t.references :shop, null: false, foreign_key: false, index: true

      t.timestamps
    end
    add_foreign_key :mattresses, :shops, primary_key: :shop_id
  end
end
