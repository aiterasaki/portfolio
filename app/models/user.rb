class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	 :recoverable, :rememberable, :trackable, :validatable

	# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	# validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
	validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

	validates :nick_name,length: { in: 2..20 }, presence: { message: 'は必須項目です。'}
	validates :first_name, length: { in: 1..20 },presence: { message: 'は必須項目です。'}
	validates :last_name, length: { in: 1..20 },presence: { message: 'は必須項目です。'}
	validates :first_name_kana, length: { in: 1..20 },presence: { message: 'は必須項目です。'}
	validates :last_name_kana, length: { in: 1..20 },presence: { message: 'は必須項目です。'}


	# VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}$|\z/i
	# validates :POSTAL_CODE, presence: true, uniqueness: true, format: { with: VALID_POSTAL_CODE_REGEX }
	validates :postal_code,  format: { with: /\A\d{3}[-]\d{4}\z|\A\d{3}[-]\d{2}\z|\A\d{3}\z/ }, presence: { message: 'は必須項目です。'}
	# , format: { with: VALID_POSTAL_CODE_REGEX }
	

	belongs_to :region
	
	has_many :products, dependent: :destroy
	has_many :orders
end
