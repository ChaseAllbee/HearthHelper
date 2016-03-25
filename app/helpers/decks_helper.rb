module DecksHelper

	# Returns array of mana costs (0, 1, 2, ..., 8+) for a deck
	def mana_curve
		mana_costs = Array.new(9, 0)
		@deck.cards.each do |card|
			cost = card.cost
			cost = 8 if cost > 8
			mana_costs[cost] += @deck.quantity(card)
		end
		return mana_costs
	end

	#Returns meta decks
	def get_meta_decks(month)
		ExternalDeck.with_tier(params[:tier] || 1).with_month(month).with_class(params[:selected_class])
	end

end
