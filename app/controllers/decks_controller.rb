class DecksController < ApplicationController
  include DecksHelper
  before_action :logged_in_user

  def index
    @recommended_decks = []
    all_decks = get_all_current_decks
    @meta_decks = all_decks.with_tier(params[:tier] || 1)
    @num_owned_rec, @dust_to_craft_rec = num_owned_and_dust_rec(all_decks)
    @num_owned_meta, @dust_to_craft_meta = num_owned_and_dust_meta
    gon.tier = params[:tier]
    gon.current_class = params[:current_class]
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
