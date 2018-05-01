class PagesController < ApplicationController

  def home
  end

  def mypage
    @user = current_user
  end

end
