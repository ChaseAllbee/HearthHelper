class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @user = User.find(current_user)
      @tracked_decks = @user.external_decks
      render 'logged_in_home'
		else
			render 'logged_out_home'
		end
  end

  
end
