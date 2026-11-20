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
class Mattress < ApplicationRecord
  belongs_to :shop, inverse_of: :mattresses
end
