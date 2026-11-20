# frozen_string_literal: true

shop_mattress_counts = {
  'Restful Home' => 3,
  'Cloud Nine' => 2,
  'The Mattress Loft' => 1,
  'Dreamland Beds' => 3,
  'Sleepy Hollow' => 2
}

shop_mattress_counts.each do |name, mattress_count|
  shop = Shop.find_or_create_by!(shop: name)
  missing_count = mattress_count - shop.mattresses.count

  missing_count.times { shop.mattresses.create! } if missing_count.positive?
end
