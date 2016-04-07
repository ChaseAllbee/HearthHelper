class StaticPagesController < ApplicationController
  include ApplicationHelper

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
  def update
    @user = User.find(current_user.id)
    @num_owned = []
    @dust_to_craft = []
    @tracked_decks = @user.external_decks
    @tracked_decks.each do |tracked_deck|
      @num_owned << num_cards_owned(tracked_deck)
      @dust_to_craft << dust_needed(tracked_deck)
    end
    @user.collection.update_attribute(:dust, params[:dust])
    render 'logged_in_home'
  end
end
