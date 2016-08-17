class RentsOfUserController < ApplicationController

  def mine
    @rents = current_user.rents
  end

  def index
    @rents = Rent.all
    @rents = @rents.where(user: current_user) if params[:filter] == 'mine'
  end

  def show
    @rent = Item.find(params[:id])
    @rent = Rent.new
    @rent.item = @item
    @rent.user = current_user
    @rents = @item.rents.where(user: current_user)
  end


end
