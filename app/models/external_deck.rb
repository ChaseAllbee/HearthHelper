class ExternalDeck < ActiveRecord::Base
  has_many :external_deck_instances
  has_many :cards, through: :external_deck_instances
  has_many :saved_external_decks
  has_many :users, through: :saved_external_decks
  validates :name, presence: true, uniqueness: true
  validates :deck_class, presence: true
end
