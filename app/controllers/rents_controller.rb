class RentsController < ApplicationController
  before_action :find_item, only: [ :new, :create ]

  def mine
    @rents = current_user.items
  end

  def index
    @rents = Rent.all
    @rents = @rents.where(user: current_user) if params[:filter] == 'mine'
  end


  def new
    @rent = Rent.new
    @rent.item = @item
    @rent.user = current_user
  end

  def create
    @rent = @item.rents.build(rent_params)
    @rent.user = current_user
    if @rent.save
      redirect_to item_path(@item), notice: 'Item Reservado'
    else
      render :new
    end
  end

  private

  def rent_params
    params.require(:rent).permit(:description, :item_id, :user_id, :end_date, :initial_date)
  end

   def find_item
    @item = Item.find(params[:item_id])
    end

end

