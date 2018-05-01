class PagesController < ApplicationController

  def home
  end

  def mypage
    @recipes = Recipe.where(user: current_user).where(state: "private")
    if params['button_action'] == 'Publish'
      @recipe.update(state: "pending")
    end
  end
end
