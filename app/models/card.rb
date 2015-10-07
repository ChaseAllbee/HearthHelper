class Card < ActiveRecord::Base
  before_save { name.downcase! }
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :card_set, presence: true
  validates :rarity, presence: true
  validates :cost, presence: true
  validates :attack, presence: true
  validates :health, presence: true
  validates :image, presence: true
  validates :card_type, presence: true
  validates :card_class, presence: true
end
