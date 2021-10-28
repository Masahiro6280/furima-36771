class Item < ApplicationRecord

  belongs_to :user


  validates :item_name,         presence: true
  validates :title,             presence: true
  validates :delivery_fee_id,   presence: true, numericality: { other_than: 1 , message: "を選択してください"} 
  validates :category_id,       presence: true, numericality: { other_than: 1 , message: "を選択してください"} 
  validates :status_id,         presence: true, numericality: { other_than: 1 , message: "を選択してください"}
  validates :area_id,           presence: true, numericality: { other_than: 1 , message: "を選択してください"}
  validates :period_id,         presence: true, numericality: { other_than: 1 , message: "を選択してください"}

  validates :place,   presence: true,  numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  validates :place,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は300円〜9,999,999円の範囲で価格設定を行ってください' }
  
  validates :user,              presence: true

  validates :image, presence: true
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  
  belongs_to :status
 
  belongs_to :delivery_fee
  
  belongs_to :area
  
  belongs_to :period
  has_one :order
end

