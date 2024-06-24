class ItemsController < ApplicationController
  def index
  end

  def new
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, 
     :charge_id, :prefecture_id, :until_shipping_id, :price, :image
     ).merge(user_id: currnet_user.id)
  end
end