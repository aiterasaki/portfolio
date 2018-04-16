20.times do |ladies|
	ProductImage.seed do |i|
		i.product_id = ladies
		i.image = Rails.root.join("public/images/ladies_thumbnail_2.jpg").open
	end

	ProductImage.seed do |i|
		i.product_id = ladies
		i.image = Rails.root.join("public/images/ladies_thumbnail_3.jpg").open
	end

	ProductImage.seed do |i|
		i.product_id = ladies
		i.image = Rails.root.join("public/images/ladies_thumbnail_4.jpg").open
	end
end

20.times do |mens|
	ProductImage.seed do |i|
		i.product_id = mens + 21
		i.image = Rails.root.join("public/images/mens_thumbnail_2.jpg").open
	end

	ProductImage.seed do |i|
		i.product_id = mens + 21
		i.image = Rails.root.join("public/images/mens_thumbnail_3.jpg").open
	end

	ProductImage.seed do |i|
		i.product_id = mens + 21
		i.image = Rails.root.join("public/images/mens_thumbnail_4.jpg").open
	end
end

20.times do |hand_made|
	ProductImage.seed do |i|
		i.product_id = hand_made + 41
		i.image = Rails.root.join("public/images/hand_made_thumbnail_2.jpg").open
	end

	ProductImage.seed do |i|
		i.product_id = hand_made + 41
		i.image = Rails.root.join("public/images/hand_made_thumbnail_3.jpg").open
	end

	ProductImage.seed do |i|
		i.product_id = hand_made + 41
		i.image = Rails.root.join("public/images/hand_made_thumbnail_4.jpg").open
	end
end

