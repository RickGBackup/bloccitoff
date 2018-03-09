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
  
  def destroy
    @item = Item.find(params[:id])
    
    if @item.user == current_user
      @item.destroy
    end
    
    respond_to do |format|
      format.html
      format.js 
    end
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
end

