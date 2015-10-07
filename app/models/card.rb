class Card < ActiveRecord::Base
  has_many :external_deck_instances
  has_many :external_decks, through: :external_deck_instances
  validates :name, presence: true, uniqueness: true
  validates :card_set, presence: true
  validates :rarity, presence: true
  validates :cost, presence: true
  validates :attack, presence: true
  validates :health, presence: true
  validates :image, presence: true
  validates :card_type, presence: true
  validates :card_class, presence: true
end

