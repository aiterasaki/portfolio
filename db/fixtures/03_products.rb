index = 1

20.times do
	Product.seed do |s|
	  s.user_id = rand(2..13)
	  s.name = rand(2..13)
	  s.id = index
	  s.brand = "ブランド名"
	  s.detail = "商品詳細#{index}"
	  s.status = rand(0..5)
	  s.burden_of_shipping_fee = rand(0..1)
	  s.shipping_method = rand(0..2)
	  s.region_id = rand(1..47)
	  s.estimated_shipping_date = rand(0..2)
	  s.price = 1000 + index
	  s.sell_flg = true
	  s.productable_id = rand(1..5)
	  s.productable_type = "LadiesCategory"
	  index += 1
	  s.thumbnail = Rails.root.join("public/images/ladies_thumbnail.jpg").open
		
		# ProductImage.seed do |i|
		# 	i.image = Rails.root.join("public/images/ladies_thumbnail_2.jpg").open
		# end

	end
end

20.times do
	Product.seed do |s|
	  s.user_id = rand(2..13)
	  s.name = rand(2..13)
	  s.id = index
	  s.brand = "ブランド名"
	  s.detail = "商品詳細#{index}"
	  s.status = rand(0..5)
	  s.burden_of_shipping_fee = rand(0..1)
	  s.shipping_method = rand(0..2)
	  s.region_id = rand(1..47)
	  s.estimated_shipping_date = rand(0..2)
	  s.price = 1000 + index
	  s.sell_flg = true
	  s.productable_id = rand(1..5)
	  s.productable_type = "MensCategory"
	  index += 1
	  s.thumbnail = Rails.root.join("public/images/mens_thumbnail.jpg").open
	end
end

20.times do
	Product.seed do |s|
	  s.user_id = rand(2..13)
	  s.name = rand(2..13)
	  s.id = index
	  s.brand = "ブランド名"
	  s.detail = "商品詳細#{index}"
	  s.status = rand(0..5)
	  s.burden_of_shipping_fee = rand(0..1)
	  s.shipping_method = rand(0..2)
	  s.region_id = rand(1..47)
	  s.estimated_shipping_date = rand(0..2)
	  s.price = 1000 + index
	  s.sell_flg = true
	  s.productable_id = rand(1..5)
	  s.productable_type = "HandmadeCategory"
	  index += 1
	  s.thumbnail = Rails.root.join("public/images/hand_made_thumbnail.jpg").open
	end
end