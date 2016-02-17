require 'pry'
class CartsController < ApplicationController


  def index
    @carts = current_user.carts
  end

  def show
    set_cart
  end

  def checkout
    #binding.pry
    @cart = Cart.find(params[:id])
    @cart.empty_cart
    @cart.line_items.delete
    redirect_to cart_path(@cart)
  end

  private

    def set_cart
      @current_cart = current_user.current_cart
    end
end
