module StaticPagesHelper

	# Retrieves cards that are in both deck and collection where
	# deck qty <= collection qty (since collection can have more than 2 instances)
	def quantity_same_query(coll_id, tracked_deck_id)
		Card.joins(:external_deck_instances).joins(:collection_card_instances)
				.where("collection_id = ? and external_deck_id = ? and
								external_deck_instances.quantity <= 
								collection_card_instances.quantity",
								coll_id, tracked_deck_id
							)
	end

	# Retrieves cards that are in both deck and collection where
	# deck qty != collection qty
	def quantity_diff_query(coll_id, tracked_deck_id)
		Card.joins(:external_deck_instances).joins(:collection_card_instances)
				.where("collection_id = ? and external_deck_id = ? and 
								external_deck_instances.quantity != 
								collection_card_instances.quantity",
								coll_id, tracked_deck_id
							)
	end

	# Retrieves cards that are in the deck but not collection
	def deck_not_collection_query(coll_id, tracked_deck_id)
		cards_in_collection = Card.joins(:collection_card_instances)
															.where("collection_id = ?", coll_id)
									 						.select("cards.id").to_sql
		Card.joins(:external_deck_instances)
				.where("external_deck_id = ? and 
								cards.id NOT IN (#{cards_in_collection})", tracked_deck_id
							)
	end

	# Totals number of cards missing for tracked deck
	def num_cards_owned(tracked_deck)
		@quantity_same_cards = quantity_same_query(coll_id, tracked_deck_id(tracked_deck))
		@quantity_diff_cards = quantity_diff_query(coll_id, tracked_deck_id(tracked_deck))
		@quantity_same_cards.count + @quantity_diff_cards.count
	end

	# Calculates dust needed to craft remainder of deck
	def dust_needed(tracked_deck)
		@deck_not_collection_cards = deck_not_collection_query(coll_id, tracked_deck_id(tracked_deck))
		dust_total(@quantity_diff_cards) + dust_total(@deck_not_collection_cards)
	end

	# Returns user's collection ID
	def coll_id
		current_user.collection.id
	end

	# Returns tracked deck ID
	def tracked_deck_id(tracked_deck)
		tracked_deck.id
	end

	# Returns dust total for cards
	def dust_total(cards)
		cards.inject(0) do |dust_total, card|
			dust_total + dust_value(card.rarity)
		end
	end

	# Returns the dust value associated with card's rarity
	def dust_value(card_rarity)
		case card_rarity
		when "Common"
			return 40
		when "Rare"
			return 100
		when "Epic"
			return 400
		when "Legendary"
			return 1600
		end
	end
end