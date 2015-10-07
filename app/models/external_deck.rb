class ExternalDeck < ActiveRecord::Base
  has_many :external_deck_instances
  has_many :cards, through: :external_deck_instances
  validates :name, presence: true, uniqueness: true
end
