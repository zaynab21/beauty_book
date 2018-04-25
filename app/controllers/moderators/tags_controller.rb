class Moderator::TagsController < Moderators::ApplicationController
before_action :set_tag, only: [:new, :create, :edit, :update]

  def new
    #récupérer la value du recipes_controller
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to recipes_path #stay in page
      flash[:success] = " Tag created"
    else
      flash[:alert] =  @tag.errors.full_messages

      render :new
    end
  end

   def edit

  end

  def update

  end

private

  def set_tag
    @recipe = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
