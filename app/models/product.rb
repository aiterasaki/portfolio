class Product < ApplicationRecord
	# validates :detail, presence: true
	validates :price, presence: true
	validates_presence_of :name
	validates_presence_of :thumbnail
  	attachment :thumbnail

  	# 複数関連しているテーブルとのアソシエーションの記述
  	# つまり、ladies,mens,handmadeテーブルたち
  	belongs_to :productable, polymorphic: true
  	accepts_attachments_for :productable
	
	belongs_to :region	
	belongs_to :user

	has_many :product_orders

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

end
