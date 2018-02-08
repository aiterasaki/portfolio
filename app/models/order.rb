class Order < ApplicationRecord
	has_many :product_orders

	belongs_to :user
	belongs_to :region
end
