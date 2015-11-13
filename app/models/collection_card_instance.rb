class CollectionCardInstance < ActiveRecord::Base
	belongs_to :collection 
	belongs_to :card
end
