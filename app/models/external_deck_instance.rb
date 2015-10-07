class ExternalDeckInstance < ActiveRecord::Base
  belongs_to :external_deck
  belongs_to :card
end
