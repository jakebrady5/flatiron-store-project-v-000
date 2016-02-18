require 'pry'
class CartsController < ApplicationController


  def show
    binding.pry
    set_cart
  end

  def checkout
    #binding.pry
    @cart = Cart.find(params[:id])
    @cart.empty_cart
    @cart.line_items.delete
    redirect_to cart_path(@cart)
  end


end
