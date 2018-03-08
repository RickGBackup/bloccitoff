class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @name = @user.name
    @items = @user.items
    @item = Item.new
  end
  
  def user_home
    redirect_to current_user
  end
end
