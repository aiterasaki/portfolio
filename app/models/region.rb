class Region < ApplicationRecord
	has_many :products
	has_many :users
end
