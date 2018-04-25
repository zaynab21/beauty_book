class Moderators::TagsController < Moderators::ApplicationController
before_action :set_tag, only: [:edit, :update]

  def new
    #récupérer la value du recipes_controller
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to moderators_recipes_path
      flash[:success] = " Tag created"
    else
      flash[:alert] =  @tag.errors.full_messages

      render :new
    end
  end

   def edit
  end

  def update
    @tag.update(tag_params)
    redirect_to moderators_recipes_path
  end

private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
