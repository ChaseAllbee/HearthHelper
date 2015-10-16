class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @user = User.find(current_user)
      render 'users/show'
    end
  end

  def contact
  end
end
