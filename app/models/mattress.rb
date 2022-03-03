# frozen_string_literal: true

# == Schema Information
#
# Table name: mattresses
#
#  id         :integer          not null, primary key
#  shop_id    :integer          not null, indexed
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Foreign Keys
#
#  shop_id  (shop_id => shops.shop_id)
#
class Mattress < ApplicationRecord
  belongs_to :shop, inverse_of: :mattresses, foreign_key: :shop_id, primary_key: :shop_id
end
