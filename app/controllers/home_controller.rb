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
    else
      flash[:error] = @grocery.errors.full_messages.join('<br />')
    end

    redirect_to root_path
  end
end
