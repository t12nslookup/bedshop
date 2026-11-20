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
class Shop < ApplicationRecord
  self.primary_key = :shop_id

  has_many :mattresses, inverse_of: :shop, dependent: :destroy

  validates :shop, presence: true
end
