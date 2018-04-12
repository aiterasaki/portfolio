class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	 :recoverable, :rememberable, :trackable, :validatable

	validates :nick_name, presence: { message: 'は必須項目です。'}
	validates :first_name, presence: { message: 'は必須項目です。'}
	validates :last_name, presence: { message: 'は必須項目です。'}
	

	belongs_to :region
	
	has_many :products, dependent: :destroy
	has_many :orders
end
