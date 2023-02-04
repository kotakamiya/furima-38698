class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}

  belongs_to :user
  has_one :item
  has_one_attached :image

end
