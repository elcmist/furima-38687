class ItemOrder
  include ActiveModel::Model
  attr_accessor :token, :num, :prefecture_id, :city, :area, :building, :phone, :item_id, :user_id
# ここにバリデーションの処理を書く
  with_options presence: true do
       validates :city, :area
       validates :prefecture_id, numericality: { other_than: 0 }
       validates :num, format: { with: /\A\d{3}[-]\d{4}\z/ }
       validates :phone, format: { with: /\A\d{11}\z/ }
    
       validates :user_id
       validates :item_id

     with_options format: { with: /\A\d{3}[-]\d{4}\z/ } do
       validates :num, length: { is: 8 } 
     end
 end

   def save
      # 各テーブルにデータを保存する処理を書く      prefecture_id
      order = Order.create(user_id: user_id, item_id: item_id)
      Address.create( num: num, prefecture_id: prefecture_id, city: city, area: area, building: building, phone: phone, order_id: order.id)
      
   end
end