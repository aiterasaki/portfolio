index = 1

10.times do
	Product.seed do |s|
	  s.id = index
	  s.brand = "shinpin"
	  s.detail = "商品詳細#{index}"
	  s.status = 1
	  # s.burden_of_shipping_fee = 100 + index
	  s.shipping_method = 1
	  s.region_id = 1
	  s.estimated_shipping_date = 1
	  s.price = 1000 + index
	  s.sell_flg = true
	  index += 1
	end
end
