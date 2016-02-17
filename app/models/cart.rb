class Cart < ActiveRecord::Base
  has_many :line_items
  belongs_to :user
  has_many :items, through: :line_items

  def total
    items = self.items
    total = 0
    items.each do |item|
      total += item.price
    end
    total
  end

  def add_item(item_id)
    if self.items.include?(Item.find(item_id))
      liner = LineItem.find_by(cart_id: self.id, item_id: item_id)
      liner.quantity += 1
    else
      liner = LineItem.new(cart_id: self.id, item_id: item_id, quantity: 1)
    end
    liner
  end

end
