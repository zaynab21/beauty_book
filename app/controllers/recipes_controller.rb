class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @recipes = Recipe.global_search(params[:query])
    else
      @recipes = Recipe.all
    end
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
      flash[:success] = "your recipe will be reviewed within 24hours"
      redirect_to recipes_path

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
