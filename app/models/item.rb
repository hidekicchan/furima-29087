class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_date
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 0 } 
    validates :status_id, numericality: { other_than: 0 } 
    validates :shipping_fee_id, numericality: { other_than: 0 } 
    validates :prefecture_id, numericality: { other_than: 0 } 
    validates :shipping_date_id, numericality: { other_than: 0 } 
    validates :price, format: {with: /\A[0-9]+\z/i },numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
end
