class StaticPagesController < ApplicationController
	include StaticPagesHelper

  def home
    if logged_in?
    	@num_owned = []
    	@dust_to_craft = []
      @user = User.find(current_user.id)
      @tracked_decks = @user.external_decks
      @tracked_decks.each do |tracked_deck|
      	@num_owned << num_cards_owned(tracked_deck)
      	@dust_to_craft << dust_needed(tracked_deck)
      end
      render 'logged_in_home'
		else
			render 'logged_out_home'
		end
  end
end
