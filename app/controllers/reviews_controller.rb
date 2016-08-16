class ReviewsController < ApplicationController
  before_action :find_item, only: [ :new, :create ]

  def new
    @review = Review.new
    @review.item = @item
    @review.user = current_user
  end

  def create
    @review = @item.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to item_path (@item)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :item_id, :user_id)
  end

   def find_item
    @item = Item.find(params[:item_id])
    end


end
