class Moderators::RecipesController < Moderators::ApplicationController
before_action :set_recipe, only: [:new, :create, :edit, :update]

  def index
    @recipes = Recipe.where(state: "pending")
    @tags = Tag.all
  end

  # def new
  #   #récupérer la value du recipes_controller
  #   @recipe = Recipe.new
  # end

  # def create
  #   @recipe = Recipe.new(recipe_params)
  #   if @recipe.save
  #     redirect_to recipes_path #stay in page
  #     flash[:success] = " The preparation was successfully published"
  #   else
  #     flash[:alert] =  @recipe.errors.full_messages

  #     render :new
  #   end
  #end

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

  def recipe_params
    params.require(:recipe).permit(:title, :state, :effect, :difficulty, :description, :cost, :purpose, tag_ids: [] )
  end
end
