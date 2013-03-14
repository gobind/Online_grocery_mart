class HomeController < ApplicationController

  def index
    @groceries = Grocery.all
  end

  def create_grocery
    @title = "Create new grocery"
  end

  def create
    @grocery = Grocery.new(params[:grocery])
    if @grocery.save
      flash[:notice] = "Grocery item created"
      redirect_to root_path
    else
      flash[:error] = @grocery.errors.full_messages.join('<br />')
      render :create_grocery
    end

  end
end
