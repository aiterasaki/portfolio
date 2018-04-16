index = 1
Brand = ['hoge', 'piyo', 'fuga']
Ladies = ['カジュアル', 'フォーマル', 'オールマイティ']
Mens = ['カジュアル', 'フォーマル', 'プレゼント・いただきもの', '自宅保管']
Handmade =['パーツ', 'ハンドメイド服', 'パターン紙', 'ばら売りもできます！！']
Detail =['細かい傷やよれがありますが基本的に綺麗な状態です。 
	Ü +-+-+-+-+-+-+-+-+-+-+ Ü この商品は他のサイトにも出品されています。 ---', 
	'祖父から頂きました。60～70年代の物かと思います。ロゴも筆記体なのでレアです。
	レザークリーム、オイルでしっかりとケアしてきたので状態はかなり良いかと思います。', 
	'ガネーシャと天然石で、チャーム、ピアス、ヘアゴム 、ストラップ販売中です！
	ガネーシャはインドでは金運や恋愛運、健康運と言ったすべての運勢に効果があると言われています。',
	'中古品になります。三年ほど前購入。昨年一度も着ず、今年、一度のみ着用・・・
	サイズ表表記見当たりませんが、S〜Mを着用されるかたならちょうどかと出品してみました。
	神経質な方はお控えください']

20.times do
	Product.seed do |s|
	  s.user_id = rand(2..12)
	  s.name = Ladies[rand(3)]
	  s.id = index
	  s.brand = Brand[rand(3)]
	  s.detail = Detail[rand(4)]
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
	end
end

20.times do
	Product.seed do |s|
	  s.user_id = rand(2..12)
	  s.name = Mens[rand(4)]
	  s.id = index
	  s.brand = Brand[rand(3)]
	  s.detail = Detail[rand(4)]
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
	  s.user_id = rand(2..12)
	  s.name = Handmade[rand(4)]
	  s.id = index
	  s.brand = Brand[rand(3)]
	  s.detail = Detail[rand(4)]
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