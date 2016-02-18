class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    def set_cart
      if current_user.current_cart.nil?
        @current_cart = Cart.create(user_id: current_user.id)
      else
        @current_cart = current_user.current_cart
      end
    end
end
