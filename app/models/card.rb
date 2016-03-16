class Card < ActiveRecord::Base
  has_many :external_deck_instances
  has_many :external_decks, through: :external_deck_instances
  has_many :collection_card_instances
  has_many :collections, through: :collection_card_instances
  has_many :user_deck_instances
  has_many :user_decks, through: :user_deck_instances
  validates :name, presence: true, uniqueness: true
  validates :card_set, presence: true
  validates :rarity, presence: true
  validates :cost, presence: true
  validates :attack, presence: true
  validates :health, presence: true
  validates :image, presence: true
  validates :card_type, presence: true
  validates :card_class, presence: true

  # Returns ids of all playable cards of same class in ascending mana cost
  def self.with_class(card_class)
    where("card_class = ?", card_class).where("cost >= 0").order(cost: :asc)
  end

  # Returns all playable cards
  def self.all_playable
    where("cost >= ?", 0).order(card_class: :asc).order(cost: :asc)
  end
end

