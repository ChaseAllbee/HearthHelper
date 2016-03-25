class DecksController < ApplicationController
  include DecksHelper
  before_action :logged_in_user

  def index
    month = Date.today.strftime("%B")
    @meta_decks = get_meta_decks(month)
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
    deck_id = @deck.id
    @cards_missing = deck_not_collection_query(coll_id, deck_id)
    gon.mana_costs = mana_curve
  end
end
