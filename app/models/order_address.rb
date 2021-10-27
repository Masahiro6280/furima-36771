class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_number, :area_id, :city, :house_num, :building_name, :phone_number, :order_id, :user_id, :item_id, :token
  validates :token, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true
  with_options presence: true do

    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: {other_than: 1, message: "can't be blank"}
end
    validates :phone_number, length: {minimum: 10, maximum: 11, message: 'は10~11桁で入力してください'}
    validates :phone_number, presence: true,  numericality: { with: /\A\d{10,11}\z/, message: 'Half-width number' }
    validates :city, presence: true
 
    validates :house_num, presence: true
    
  
   
  
  def save
  
    order = Order.create(item_id: item_id, user_id: user_id)
    
    Address.create(post_number: post_number, area_id: area_id, city: city, house_num: house_num, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end

end