class PagesController < ApplicationController

  def home
  end

  def mypage
    @recipes = Recipe.where(user: current_user).where(state: "private")
  end
end
