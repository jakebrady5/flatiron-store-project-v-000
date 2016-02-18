class Cart < ActiveRecord::Base
  has_many :line_items
  belongs_to :user
  has_many :items, through: :line_items

  def line_item_id=(l_id)
    line = LineItem.find_or_create_by(id: l_id)
    line.cart_id = self.id
  end

  def line_item=(ids)
    ids.each do |id|
      if !id.empty?
        selected_line_item = LineItem.find(id)
        self.line_items << selected_line_item unless self.line_items.include? selected_line_item
      end
    end
  end

  def line_items_attributes=(line_item_attributes)
    if !line_item_attributes.empty? && line_item_attributes != ''
      line_item = LineItem.find_or_create_by(line_item_attributes)
      self.line_items << line_item unless self.line_items.include? line_item
    end
  end


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
      liner = LineItem.create(cart_id: self.id, item_id: item_id, quantity: 1)
    end
    liner
  end

  def empty_cart
    self.line_items.each do |line|
      line.item.inventory -= line.quantity
      line.item.save
    end
    self.line_items.clear
  end

end
