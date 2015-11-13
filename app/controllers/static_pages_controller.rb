class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @user = User.find(current_user)
      render 'logged_in_home'
		else
			render 'logged_out_home'
		end
  end

  def contact
  end
end
