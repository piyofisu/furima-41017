class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    return if current_user.id != @item.user.id

    redirect_to root_path
  end
end
