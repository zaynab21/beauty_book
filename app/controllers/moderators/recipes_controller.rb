class Moderators::RecipesController < Moderators::ApplicationController
before_action :set_recipe, only: [:new, :create, :edit, :update, :destroy]

  def index
    @recipes = Recipe.where(state: "pending")
    @tags = Tag.all
  end

  def edit
    @recipe.recipe_photos.build
    @recipe.recipe_photos.build
  end

  def update
    @recipe.update(recipe_params)
    if params['button_action'] == 'Publish'
      @recipe.update(state: "published")
    elsif params['button_action'] == 'Decline'
      @recipe.update(state: "declined")
    end
    redirect_to moderators_recipes_path
  end

  def destroy
    @recipe.destroy
    redirect_to moderators_recipes_path
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :state, :feature, :difficulty, :description, :cost, :category, tag_ids: [], recipe_photos_attributes: [:photo] )
  end
end
