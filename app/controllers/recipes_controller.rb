class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @recipes = Recipe.global_search(params[:query]).where(state: "published")
    else
      @recipes = Recipe.all.where(state: "published")
    end
    @recipes = @recipes.order(cost: :desc) if params[:cost] == "desc"
    @recipes = @recipes.order(cost: :asc) if params[:cost] =="asc"
    @recipes = @recipes.order(difficulty: :desc) if params[:cost] == "diff_desc"
    @recipes = @recipes.order(difficulty: :asc) if params[:cost] =="diff_asc"
  end

  def show
  end

  def new
    @recipe = Recipe.new
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
    params.require(:recipe).permit(:title, :state, :effect, :difficulty, :description, :cost, :purpose, tag_ids: [] )
  end
end
