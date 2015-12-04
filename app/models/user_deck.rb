class UserDeck < ActiveRecord::Base
  belongs_to :user
  has_many :user_deck_instances
  has_many :cards, through: :user_deck_instances
  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
end
