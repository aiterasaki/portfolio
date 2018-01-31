class HandmadeCategory < ApplicationRecord
	belongs_to :category
	has_many :products, as: :productable
end
