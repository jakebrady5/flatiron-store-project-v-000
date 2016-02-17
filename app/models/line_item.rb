class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :cart
  has_many :users, through: :cart
end
