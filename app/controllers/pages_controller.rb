class PagesController < ApplicationController

  def home
  end

  def mypage
    @user = current_user
    @recipes = Recipe.where(user: current_user).where(state: "private")
  end

end
