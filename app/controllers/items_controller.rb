class ItemsController < ApplicationController


  def index
    @items = Item.all
    @title = 'Todos os itens'
    if params[:filter] == 'mine'
      @items = @items.where(user: current_user)
      @title = 'Meus Itens'
    end
    if params[:search]
      @title = 'Pesquisa Itens'
      if params[:search]
        @items = Item.search(params[:search]).order("created_at DESC")
      else
        @items = Item.all.order('created_at DESC')
      end
    end
    @items = @items.where(user: current_user) if params[:filter] == 'mine'
    @hash = Gmaps4rails.build_markers(@items) do |item, marker|
      marker.lat item.latitude
      marker.lng item.longitude
    end
  end

  def show
    @item = Item.find(params[:id])
    @rent = Rent.new
    @rent.item = @item
    @item_coordinates = { lat: @item.latitude, lng: @item.longitude }
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

  def search
    @item = Item.new
    @item.user = current_user
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save(item_params)
      redirect_to items_path, notice: 'Item Criado!' #mudar para My_itens
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
    redirect_to items_path, notice: 'Item Atualizado!'#mudar para My_itens
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path, notice: 'Item Apagado!'#mudar para My_itens
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :description, :price, :category, :picture, :picture_cache, :quantity)
  end

  def find_item
    @item = Item.find(params[:item_id])
  end
end
