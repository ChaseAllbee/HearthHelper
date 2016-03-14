class ExternalDeck < ActiveRecord::Base
  has_many :external_deck_instances
  has_many :cards, through: :external_deck_instances
  has_many :saved_external_decks
  has_many :users, through: :saved_external_decks
  validates :name, presence: true
  validates :deck_class, presence: true
  validates :tier, presence: true, numericality: {
                                                   only_integer: true,
                                                   greater_than: 0,
                                                   less_than: 5
                                                 }
  # Returns the quantity of a given card for the deck
  def quantity(card)
    external_deck_instances.find_by(card_id: card.id).quantity
  end
end
