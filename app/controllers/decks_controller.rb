class DecksController < ApplicationController
  include DecksHelper
  before_action :logged_in_user

  def index
    month = Date.today.strftime("%B")
    @meta_decks = ExternalDeck.with_tier(1).with_month(month).with_class(params[:selected_class])
    @num_owned = []
    @dust_to_craft = []
    @meta_decks.each do |meta_deck|
    	@num_owned << num_cards_owned(meta_deck)
    	@dust_to_craft << dust_needed(meta_deck)
    end
  end

  def new
  end

  def show
    @deck = ExternalDeck.find(params[:id])
    @num_owned = num_cards_owned(@deck)
    @dust_to_craft = dust_needed(@deck)
    gon.mana_costs = mana_curve
  end
end
