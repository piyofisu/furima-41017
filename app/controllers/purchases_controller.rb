class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_items, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
    return if current_user.id != @item.user.id

    redirect_to root_path
    
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
    # @purchase = Purchase.new(purchase_params)
    # if @purchase.valid?
    #   @purchase.save
    #   Address.create(address_params)
    #   return redirect_to root_path
    # else
    #   render 'index', status: :unprocessable_entity
    # end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post, :prefecture_id, :municipalities, :street_address,
    :building_name, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id] )
  end

  def set_items
    @item = Item.find(params[:item_id])
  end
end
