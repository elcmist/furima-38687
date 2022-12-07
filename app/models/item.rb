class Item < ApplicationRecord
  belongs_to :user
  # has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :delivery_day

  with_options presence: true do 
    validates :name
    validates :explanation
    validates :image
    validates :price

    with_options  numericality: { other_than: 0 } do
      validates :category_id
      validates :status_id
      validates :delivery_cost_id
      validates :prefecture_id
      validates :delivery_day_id
      
    end
    
  end

  validates_inclusion_of :price, in: (300..9999999), format: {with: /\A[0-9]+\z/ }


end
