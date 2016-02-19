class StoreController < ApplicationController

  def index
    @categories = Category.all
    @items = Item.all
    set_cart
  end


end
