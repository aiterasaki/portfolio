class Order < ApplicationRecord
	has_many :product_orders
	has_many :products, through: :product_orders

	belongs_to :user
	belongs_to :region

	enum method_of_payment: {credit_card: 0,
							 convenience: 1
								    }

	# enum method_of_payment: {クレジットカード払い: 0,
	# 						   コンビニ払い: 1
	# 							     }

end
