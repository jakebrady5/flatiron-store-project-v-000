class Item < ActiveRecord::Base
  has_many :line_items
  belongs_to :category
  has_many :quantity, through: :line_items

  def self.available_items
    available_items = []
    @items = Item.all
    @items.map do |item|
      if item.inventory > 0
        available_items << item
      end
    end
    available_items
  end

end
