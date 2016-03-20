class CollectionCardInstance < ActiveRecord::Base
	belongs_to :collection
	belongs_to :card
  validates :quantity, presence: true,
                       numericality: { greater_than: 0,
                                       less_than_or_equal_to: 15
                                     }

  def self.increment_qty(card_id)
    find_by(card_id: card_id).increment!(:quantity)
  end

  def self.decrement_qty_or_destroy(card_id)
    card = find_by(card_id: card_id)
    card.quantity > 1 ? card.decrement!(:quantity) : destroy(card)
  end
end
