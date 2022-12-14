class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :orders
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         with_options presence: true do
          validates :nickname
          
          validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
          validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
          validates :kana_last_name, format: { with: /\A[ァ-ヶー－]+\z/ }
          validates :kana_first_name, format: { with: /\A[ァ-ヶー－]+\z/ }
          validates :birthday
         end 

         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

         
end
