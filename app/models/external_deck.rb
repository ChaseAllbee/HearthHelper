class ExternalDeck < ActiveRecord::Base
  has_many :external_deck_instances
  has_many :cards, through: :external_deck_instances
  has_many :saved_external_decks
  has_many :users, through: :saved_external_decks
  validates :name, presence: true, uniqueness: true
  validates :deck_class, presence: true
  validates :tier, presence: true, numericality: {
                                                   only_integer: true,
                                                   greater_than: 0,
                                                   less_than: 5
                                                 }

end
