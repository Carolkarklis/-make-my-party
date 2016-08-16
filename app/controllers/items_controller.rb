class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @rent = Rent.new
    @rent.item = @item
    @rent.user = current_user
    @rents = @item.rents.where(user: current_user)

  end

  def search(product_name)
    @item = Item.where(product_name: params[:product_name])
  end

  def new
      @item = Item.new
      @item.user = current_user
    end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save(item_params)
      redirect_to item_path (@item)
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_path (@item)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :description, :price, :category, :picture, :picture_cache)
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

end
