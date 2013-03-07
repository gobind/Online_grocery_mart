class CartController < ApplicationController
  def index
    @cart = Cart.find_by_id(session['cart_id'])
    if @cart.present?
      redirect_to home_index_path
      return
    else
      @groceries = @cart.grocery_id.present? ? @cart.groceries : nil
    end
  end

  def add_to_cart
    @current_cart = Cart.find_by_id(session['cart_id'])
    @current_cart = @current_cart || Cart.create
    session['cart_id'] = @current_cart.id
    grocery = Cart.find(params[:grocery_id])

    if @current_cart.present?
        item = @current_cart.groceries.where(:grocery_id => grocery.id).first if @current_cart.grocery_id.present?
        if item.present?
          item.update_attribute("quantity", (item.quantity.to_i + 1))
        else
          cart_item = @current_cart.groceries.build
          cart_item = grocery
          cart_item.save
        end
      end
      flash[:success] = "Grocery added to your"
      redirect_to cart_path 
  end

  def checkout
    @cart = Cart.find(params[:cart_id])
    @cart.update_attribute('status', 'ordered')
    session.delete("cart_id")
  end
end
