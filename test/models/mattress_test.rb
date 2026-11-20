# frozen_string_literal: true

# == Schema Information
#
# Table name: mattresses
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  shop_id    :integer          not null, indexed
#
# Indexes
#
#  index_mattresses_on_shop_id  (shop_id)
#
# Foreign Keys
#
#  shop_id  (shop_id => shops.shop_id)
#
require 'test_helper'

class MattressTest < ActiveSupport::TestCase
  test 'belongs to a shop' do
    assert_equal shops(:one), mattresses(:one).shop
  end

  test 'requires a shop' do
    mattress = Mattress.new

    assert_not mattress.valid?
    assert_includes mattress.errors.attribute_names, :shop
  end
end
