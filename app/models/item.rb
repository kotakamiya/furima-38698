class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping
  belongs_to :area
  belongs_to :number_of_day

  validates :image, presence: true
  validates :item_name, presence: true
  validates :explain, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :state_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :shipping_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :area_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :number_of_day_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :price,numericality: { other_than: 1, message: "can't be blank"}, presence: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  belongs_to :user
  has_one :item
  has_one_attached :image

end
