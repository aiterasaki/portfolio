class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

soft_deletable #gem 'kakurenbo-puti'で使用。

  # Deviseを使うと、問答無用でemailがユニーク扱いになる。
  # それだと論理削除した際に再登録できないので、一旦emailに関する検証を削除する
  # https://gist.github.com/brenes/4503386
  _validators.delete(:email)
  _validate_callbacks.each do |callback|
    if callback.raw_filter.respond_to? :attributes
      callback.raw_filter.attributes.delete :email
    end
  end

# Deviseの認証に関わる箇所
  def self.find_for_authentication(warden_conditions)
    without_soft_destroyed.where(email: warden_conditions[:email]).first
  end

	validates :email,presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
	validates_format_of :email, with: Devise.email_regexp, if: :email_changed?
	validates_uniqueness_of :email, scope: :deleted_at, if: :email_changed?
	validates :nick_name,length: { in: 2..20 }, presence: { message: 'は必須項目です。'}
	validates :first_name, length: { in: 1..20 },presence: { message: 'は必須項目です。'}
	validates :last_name, length: { in: 1..20 },presence: { message: 'は必須項目です。'}
	validates :first_name_kana, length: { in: 1..20 },presence: { message: 'は必須項目です。'}
	validates :last_name_kana, length: { in: 1..20 },presence: { message: 'は必須項目です。'}
	validates :postal_code,  format: { with: /\A\d{3}[-]\d{4}\z|\A\d{3}[-]\d{2}\z|\A\d{3}\z/ }, presence: { message: 'は必須項目です。'}

	belongs_to :region
	
	has_many :products, dependent: :destroy
	has_many :orders

end