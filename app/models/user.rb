class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	 :recoverable, :rememberable, :trackable, :validatable

	validates :nick_name, presence: true
	validates :first_name, presence: true
	validates :last_name, presence: true
	
	# validates :name, presence: true, uniqueness: true


	belongs_to :region
	
	has_many :products
	has_many :orders
end
