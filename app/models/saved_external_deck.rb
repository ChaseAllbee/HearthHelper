class SavedExternalDeck < ActiveRecord::Base
	belongs_to :user
	belongs_to :external_deck
end
