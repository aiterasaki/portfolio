class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	 :recoverable, :rememberable, :trackable, :validatable

	validates_uniqueness_of :nick_name
	validates_presence_of :nick_name

	belongs_to :region
	
	has_many :products
end
