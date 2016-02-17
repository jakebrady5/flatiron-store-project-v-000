require 'pry'
class LineItemsController < ApplicationController

  def create
    find_cart.add_item(params[:item_id]).save
    redirect_to cart_path(current_user.current_cart)
  end


  private
    def find_cart
      if current_user.current_cart.nil?
        current_user.current_cart = Cart.create(user_id: current_user.id)
      else
        current_user.current_cart
      end
    end

end
