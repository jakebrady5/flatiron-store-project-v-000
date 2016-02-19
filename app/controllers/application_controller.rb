class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_cart

  private

    def set_cart
      if current_user
        if current_user.current_cart.nil?
          current_user.current_cart = Cart.create(user_id: current_user.id)
          @current_cart = current_user.current_cart
        else
          @current_cart = current_user.current_cart
        end
      end
    end
end
