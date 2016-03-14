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
end