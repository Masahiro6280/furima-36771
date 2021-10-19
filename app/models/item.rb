class Item < ApplicationRecord

  belongs_to :user


  validates :item_name,         presence: true
  validates :title,             presence: true
  validates :delivery_fee_id,   presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :category_id,       presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :status_id,         presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id,           presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :period_id,         presence: true, numericality: { other_than: 1 , message: "can't be blank"}

  validates :place,   presence: true,  numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :place,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  
  validates :user,              presence: true

  validates :image, presence: true
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  
  belongs_to :status
 
  belongs_to :delivery_fee
  
  belongs_to :area
  
  belongs_to :period
end

