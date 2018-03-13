index = 1

12.times do
	Product.seed do |s|
	  s.user_id = rand(2..13)
	  s.name = rand(2..13)
	  s.id = index
	  s.brand = "ブランド名"
	  s.detail = "商品詳細#{index}"
	  s.status = 1
	  s.burden_of_shipping_fee = 1
	  s.shipping_method = 1
	  s.region_id = rand(1..47)
	  s.estimated_shipping_date = rand(1..2)
	  s.price = 1000 + index
	  s.sell_flg = true
	  s.productable_id = 1
	  s.productable_type = "LadiesCategory"
	  index += 1
	  s.thumbnail = Rails.root.join("public/preparation.png").open
	end
end
