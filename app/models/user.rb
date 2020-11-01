class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # with_options presence: true do
  #   validates :nickname
  #   validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  #   validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  #   validates :reading_family,  format: { with: /\A[ァ-ヶー－]+\z/ }
  #   validates :reading_first,  format: { with: /\A[ァ-ヶー－]+\z/ }
  #   validates :birthday
  # end
  validates :nickname, presence: true
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
  validates :reading_family, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'kana Full-width katakana characters' }
  validates :reading_first, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'kana Full-width katakana characters'  }
  validates :birthday, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, length: { minimum: 6 }, format: { with: PASSWORD_REGEX, message: 'include both letters and numbers' }
end
