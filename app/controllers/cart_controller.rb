class CartController < ApplicationController
  def index
    @cart = Cart.find_by_id(session['cart_id'])

    if @cart.blank?
      redirect_to home_index_path
      return
    else
      @groceries = @cart.cart_items.present? ? @cart.cart_items : nil
    end
  end

  def add_to_cart
    @current_cart = Cart.find_by_id(session['cart_id'])
    @current_cart = if @current_cart.present? 
                      @current_cart
                    else
                      Cart.create
                    end
    session['cart_id'] = @current_cart.id
    grocery = Grocery.find(params[:grocery_id])

      if @current_cart.present?
        item = @current_cart.cart_items.where(:grocery_id => grocery.id).first
        if item.present?
          item.update_attribute("quantity", (item.quantity.to_i + 1))
        else
          cart_item = @current_cart.cart_items.create
          cart_item.grocery = grocery
          cart_item.name = grocery.name
          cart_item.price = grocery.price
          cart_item.quantity = "1"
          cart_item.description = grocery.description
          cart_item.save
        end
      end

      flash[:success] = "Grocery added to your"
      redirect_to cart_path 
  end

  def checkout
    @cart = Cart.find(params[:cart_id])
    @cart.update_attributes(params['cart'])
    @cart.update_attribute('status', 'ordered')
    session.delete("cart_id")

    flash[:success] = "You successfully checked out"
    redirect_to root_path
  end
end
