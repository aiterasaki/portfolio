20.times do
	ProductImage.seed do |i|
		i.id = 1
		i.image = Rails.root.join("public/images/ladies_thumbnail_2.jpg").open
	end
end