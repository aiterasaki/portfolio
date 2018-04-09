class Product < ApplicationRecord
	validates :price, numericality:  { greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999 }

# ↑バリデーション　動作確認ずみ


	# validates_presence_of :name
	validates_presence_of :thumbnail
  	attachment :thumbnail

  	# 複数関連しているテーブルとのアソシエーションの記述
  	# つまり、ladies,mens,handmadeテーブルたち
  	belongs_to :productable, polymorphic: true
 
	belongs_to :region	
	belongs_to :user
	belongs_to :admin
	
	has_one :order

	has_many :product_images, dependent: :destroy
  	accepts_attachments_for :product_images, attachment: :image

	enum status: {new_product: 0,
				  unused: 1, 
				  no_noticeable_scratch_or_dirt: 2,
				  slightly_scratched_or_dirty: 3,
				  scratches_and_dirt: 4,
				  bad: 5
				  }

	# enum status: {新品、未使用: 0,
	# 			    未使用に近い: 1, 
	# 			    目立った傷や汚れなし: 2,
	# 			    やや傷や汚れあり: 3,
	# 			    傷や汚れあり: 4,
	# 			    全体的に状態が悪い: 5
	# 				}

	enum burden_of_shipping_fee: {postage_included: 0,
								   freight_collect: 1 
								   }

	# enum burden_of_shipping_fee: {送料込み(出品者負担): 0,
	# 							   着払い（購入者負担）: 1 
	# 							   }
	
	enum shipping_method: {small: 0,
						   medium: 1,
						   big: 2
					      }

	# enum shipping_method: {らくらく便: 0,
	# 					  	 ゆうゆう便: 1,
	# 						 大型便: 2
	# 				         }


	enum estimated_shipping_date: {_2days: 0,
								   _3days: 1,
								   _7days: 2 
								    }

	# enum estimated_shipping_date: {１〜２日で発送: 0,
	# 							     ２〜３日で発送: 1,
	# 							     ４〜７日で発送: 2 
	# 							     }

# headerの検索　arel_tableの場合

  # products = Product.arel_table
  # scope :header_search, -> (search) { Product.where(
  #    products[:name].matches("%#{search.downcase}%").
  # or(products[:brand].matches("%#{search.downcase}%"))
  # ) }

# headerの検索

scope :header_search, -> (search) { where(
  "(products.name) LIKE ? OR 
   (products.brand) LIKE ? ",
  "%#{search.downcase}%",
  "%#{search.downcase}%"
) }

#商品名による絞り込み 

scope :get_by_name, ->(name) {
where("name like ?", "%#{name}%")
}
#ブランド名による絞り込み
scope :get_by_brand, ->(brand) {
where("brand like ?", "%#{brand}%")
}
# 商品の状態による絞り込み
scope :get_by_status, ->(status) {
where(status: status)
}
#配送料の負担による絞り込み
scope :get_by_burden_of_shipping_fee, ->(burden_of_shipping_fee) {
where(burden_of_shipping_fee: burden_of_shipping_fee)
}

#販売状況による絞り込み
scope :get_by_sell_flg, ->(sell_flg) {
where(sell_flg: sell_flg)
}

end