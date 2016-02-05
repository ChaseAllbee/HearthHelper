class UserDeckInstance < ActiveRecord::Base
  belongs_to :user_deck, dependent: :destroy
  belongs_to :card
  validates :quantity, presence: true,
                       numericality: { greater_than: 0,
                                       less_than_or_equal_to: 15
                                     }
end
