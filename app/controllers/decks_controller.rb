class DecksController < ApplicationController
	include ApplicationHelper
  include DecksHelper

  def index
    month = Date.today.strftime("%B")
    @meta_decks = ExternalDeck.where(tier: 1).where("name LIKE ?", "%February%")
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
    @mana_costs = mana_curve
  end
end
