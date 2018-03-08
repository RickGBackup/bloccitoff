class ItemsController < ApplicationController
  def create
    @item = current_user.items.build(item_params)
    
   if @item.save
      flash[:success] = "Item saved!"
      redirect_to current_user
   else
      flash[:alert] = "Item could not be saved."
      redirect_to :back
   end
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
end

