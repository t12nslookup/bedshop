# frozen_string_literal: true

# == Schema Information
#
# Table name: shops
#
#  shop_id    :integer          not null, primary key
#  shop       :text             not null, indexed
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
