require 'pry'
class LineItemsController < ApplicationController

  def create
    @current_cart = current_user.current_cart
    new_line = @current_cart.add_item(params[:item_id])
    new_line.save
    redirect_to cart_path(@current_cart)
  end


end
