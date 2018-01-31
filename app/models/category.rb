class Category < ApplicationRecord

	has_many :ladies_categories
	has_many :mens_categories
	has_many :handmade_categories

end

