class IngredientRecipesController < ApplicationController
  before_action :set_recipe, only: [:index, :new, :create, :index, :edit, :update, :delete]

  def index
    @ing_recipes = @recipe.ingredient_recipes
     @ingredient_recipe = IngredientRecipe.new
  end

  def new
    @ingredient_recipe = IngredientRecipe.new
  end

  def create
    @ingredient_recipe = IngredientRecipe.new(ingredient_recipe_params)
    @ingredient_recipe.recipe = @recipe
    if @ingredient_recipe.save
      flash[:success] = "Ingredient added with success "
      redirect_to recipe_ingredient_recipes_path(@recipe)
    else
      flash[:alert] =  @ingredient_recipe.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @ingredient_recipe = IngredientRecipe.find(params[:id])
    @ingredient_recipe.update(ingredient_recipe_params)
    redirect_to recipe_path(@recipe)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def ingredient_recipe_params
    params.require(:ingredient_recipe).permit(:ingredient_id, :quantity)
  end
end
