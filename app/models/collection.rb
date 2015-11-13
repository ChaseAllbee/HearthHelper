class Collection < ActiveRecord::Base
	belongs_to :user
	has_many :collection_card_instances
	has_many :cards, through: :collection_card_instances
end
