class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order

  belongs_to :category
  belongs_to :state
  belongs_to :shipping
  belongs_to :area
  belongs_to :number_of_day

  has_one_attached :image

  validates :image, presence: true
  validates :item_name, presence: true
  validates :explain, presence: true, length: { maximum: 1000 }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :state_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :shipping_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :area_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :number_of_day_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :price, presence: true, inclusion: { in: 300..9_999_999 }, numericality: { only_integer: true }
end
