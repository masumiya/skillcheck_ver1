# frozen_string_literal: true

# create varisnts (x products)

Product.all.each do |product|
  FactoryBot.create_list(:variant, rand(1..3), { product: product })
end
