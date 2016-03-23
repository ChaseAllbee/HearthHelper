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

  # Returns decks in selected tier
  def self.with_tier(tier)
    where("tier = ?", tier)
  end

  # Returns decks in selected month
  def self.with_month(month)
    where("name LIKE ?", "%#{month}%")
  end

  # Returns decks with selected class
  def self.with_class(deck_class)
    if deck_class
      where("deck_class = ?", deck_class)
    else
      where(nil)
    end
  end

end
