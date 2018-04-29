class ReviewsController < ApplicationController
  before_action :set_recipe, only: [:new, :create]

  def new
  end

  def create
    @review = Review.new(review_params)
    @review.recipe = @recipe
    if @review.save
      redirect_to recipe_path(@recipe)
    else
      render 'recipe/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :recipe_id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end


