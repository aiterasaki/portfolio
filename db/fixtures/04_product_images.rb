20.times do |num|
	ProductImage.seed do |i|
		i.product_id = num
		i.image = Rails.root.join("public/images/ladies_thumbnail_2.jpg").open
	end

	ProductImage.seed do |i|
		i.product_id = num
		i.image = Rails.root.join("public/images/ladies_thumbnail_3.jpg").open
	end

	ProductImage.seed do |i|
		i.product_id = num
		i.image = Rails.root.join("public/images/ladies_thumbnail_4.jpg").open
	end
end
