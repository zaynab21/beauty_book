class Moderator::RecipesController < ApplicationController
before_action :set_recipe, only: [:new, :create, :edit, :update]

  def index
    @recipes = Recipe.where(state: "pending")
    @tags = Tag.all
  end

  def show
    @tags = Tag_recipes.all
  end

  def new
    @recipe = Recipe.new
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

end
