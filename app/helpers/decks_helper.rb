module DecksHelper

	# Returns array of mana costs (0, 1, 2, ..., 8+) for a deck
	def mana_curve
		mana_costs = Array.new(9, 0)
		@deck.cards.each do |card|
			cost = card.cost
			cost = 8 if cost > 8
			mana_costs[cost] += @deck.quantity(card)
		end
		mana_costs
	end

	# Returns decks requiring least amount of dust to craft
	def get_all_current_decks
		ExternalDeck.with_month(current_month).with_class(params[:current_class])
	end

	def num_owned_and_dust_rec(all_decks)
		num_owned, dust_to_craft = [], []
		all_decks_dust_by_id = all_decks_crafting_cost(all_decks)
    recommended_decks = sort_and_take_top(all_decks_dust_by_id)
    recommended_decks.each do |id, dust|
    	recommended_deck = ExternalDeck.find(id)
    	num_owned << num_cards_owned(recommended_deck)
    	dust_to_craft << dust
    	@recommended_decks << recommended_deck
    end
    return num_owned, dust_to_craft
	end

	def all_decks_crafting_cost(all_decks)
		all_decks_dust_by_id = {}
    all_decks.each do |deck|
    	dust_to_craft = dust_needed(deck)
    	all_decks_dust_by_id[deck.id] = dust_to_craft
    end
    all_decks_dust_by_id
	end

	def sort_and_take_top(all_decks_dust)
		all_decks_dust.sort_by { |deck_id, dust_cost| dust_cost }[0, 5]
	end

	def num_owned_and_dust_meta
		num_owned, dust_to_craft = [], []
    @meta_decks.each do |deck|
    	num_owned << num_cards_owned(deck)
    	dust_to_craft << dust_needed(deck)
    end
    return num_owned, dust_to_craft
	end
end
