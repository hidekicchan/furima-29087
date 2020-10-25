class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :reading_family, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :reading_first, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :birthday
  end
    validates :email, uniqueness: true
    validates :password, confirmation: true, length: { minimum: 6}, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/, message: 'Password Include both letters and numbers'}
end
