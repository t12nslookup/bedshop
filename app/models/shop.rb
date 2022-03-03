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
class Shop < ApplicationRecord
  self.primary_key = :shop_id

  has_many :mattresses, inverse_of: :shop, primary_key: :shop_id, foreign_key: :shop_id
end
