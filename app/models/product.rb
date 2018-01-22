class Product < ApplicationRecord
	# validates :detail, presence: true
	validates :price, presence: true
	enum status: {shinpin: 0,hobo_shinpin: 1, kirei: 3}
	
	
end
