class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @recipes = Recipe.global_search(params[:query]).where(state: "published")
    else
      @recipes = Recipe.all.where(state: "published")
    end
    @recipes = @recipes.order(cost: :desc) if params[:sort] == "desc"
    @recipes = @recipes.order(cost: :asc) if params[:sort] =="asc"
    @recipes = @recipes.order(difficulty: :desc) if params[:sort] == "diff_desc"
    @recipes = @recipes.order(difficulty: :asc) if params[:sort] =="diff_asc"
  end

  def show
    @reviews= @recipe.reviews
    @ratings = @reviews.map do |review|
      review.rating
    end
    @average_rating = @ratings.reduce(:+).to_f / @reviews.count
    #/
    @review = Review.new
  end

  def new
    @recipe = Recipe.new
    @recipe.recipe_photos.build
    @recipe.recipe_photos.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipes_path # new_moderator_recipe_path #needs to go to moderator controller
      flash[:success] = " Your preparation was successfully submitted "
    else
      flash[:alert] =  @recipe.errors.full_messages
      render :new
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :state, :preparation_time_min, :application_time_min, :effect, :difficulty, :description, :cost, :purpose, tag_ids: [], recipe_photos_attributes: [:photo] )
  end
end
