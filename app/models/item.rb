class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_date
  has_one_attached :image
  belongs_to :user
  has_one :order

  with_options presence: true do
    validates :name
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/i }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
  end
  with_options presence: true, numericality: { other_than: 0, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_date_id
  end
end
