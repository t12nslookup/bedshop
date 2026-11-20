# frozen_string_literal: true

# == Schema Information
#
# Table name: shops
#
#  shop       :text             not null, indexed
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  shop_id    :integer          not null, primary key
#
# Indexes
#
#  index_shops_on_shop  (shop)
#
require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  test 'requires a name' do
    shop = Shop.new(shop: '')

    assert_not shop.valid?
    assert_includes shop.errors.attribute_names, :shop
  end

  test 'destroys its mattresses when destroyed' do
    shop = shops(:one)

    assert_difference('Mattress.count', -1) { shop.destroy! }
  end
end
