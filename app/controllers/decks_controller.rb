class DecksController < ApplicationController
	include ApplicationHelper

  def index
    month = Date.today.strftime("%B")
    @meta_decks = ExternalDeck.where(tier: 1).where("name LIKE ?", "%#{month}%")
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
    @dust_to_craft = []
    @num_owned = []
    @num_owned << num_cards_owned(@deck)
    @dust_to_craft << dust_needed(@deck)
  end
end
