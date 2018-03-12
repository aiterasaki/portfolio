index = 1

10.times do
	Product.seed do |s|
	  s.id = index
	  s.brand = "ブランド名"
	  s.detail = "商品詳細#{index}"
	  s.status = 1
	  s.burden_of_shipping_fee = 1
	  s.shipping_method = 1
	  s.region_id = 1
	  s.estimated_shipping_date = 1
	  s.price = 1000 + index
	  s.sell_flg = true
	  index += 1
	  s.thumbnail = Rails.root.join("public/preparation.png").open
	end
end
