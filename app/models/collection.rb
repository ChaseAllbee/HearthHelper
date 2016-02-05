class Collection < ActiveRecord::Base
	belongs_to :user
	has_many :collection_card_instances
	has_many :cards, through: :collection_card_instances
  after_create :initialize_basic_card_qty
  validates :dust, presence: true, numericality: { greater_than_or_equal_to: 0 }

  private

    def initialize_basic_card_qty
      self.collection_card_instances.each do |card|
        card.increment!(:quantity)
      end
    end
end
