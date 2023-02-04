class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping
  belongs_to :area
  belongs_to :number_of_day

  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :state_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :shipping_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :area_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :number_of_day_id, numericality: { other_than: 1, message: "can't be blank"}


  belongs_to :user
  has_one :item
  has_one_attached :image

end
