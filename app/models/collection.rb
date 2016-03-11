class Collection < ActiveRecord::Base
  attr_accessor :page_ids, :class_ids, :current_class, :first_card_id, 
                :last_card_id
	belongs_to :user
	has_many :collection_card_instances
	has_many :cards, through: :collection_card_instances
  after_create :initialize_basic_card_qty
  validates :dust, presence: true, numericality: { greater_than_or_equal_to: 0 }

  # Returns an array of classes [Druid, Hunter,..., Neutral]
  def class_list
    %w(Druid Hunter Mage Paladin Priest Rogue Shaman Warlock Warrior Neutral)
  end

  # Returns next group of cards in collection
  def next
    last_class_page? ? next_class_ids : next_slice_ids
  end

  # Returns true if last page in current class
  def last_class_page?
    @class_ids.find_index(@page_ids.last) == @class_ids.size - 1
  end

  # Returns array of first 8 card ids of next class
  def next_class_ids
    @class_ids = Card.with_class(next_class)
    @page_ids = @class_ids[0, 8]
  end

  # Returns name of next class
  def next_class
    class_idx = class_list.find_index(@current_class) + 1
    @current_class = class_list[class_idx]
  end

  # Returns card ids of next page within current class
  def next_slice_ids
    slice_idx = @class_ids.find_index(@page_ids.last) + 1
    @page_ids = @class_ids[slice_idx, 8]
  end

  # Returns previous group of cards in collection
  def prev
    first_class_page? ? prev_class_ids : prev_slice_ids
  end

  # Returns true if first page in current class
  def first_class_page?
    @class_ids.find_index(@page_ids.first) == 0
  end

  # Returns array of last card ids of previous class
  def prev_class_ids
    @class_ids = Card.with_class(prev_class)
    @page_ids = last_page_ids

  end

  # Returns name of previous class
  def prev_class
    class_idx = class_list.find_index(@current_class) - 1
    @current_class = class_list[class_idx]
  end

  # Returns last page of cards in previous class
  def last_page_ids
    @class_ids.each_slice(8) do |chunk|
      return chunk if chunk.last == @class_ids.last
    end
  end

  # Returns card ids of prev page within current class
  def prev_slice_ids
    slice_idx = @class_ids.find_index(@page_ids.first) - 8
    @page_ids = @class_ids[slice_idx, 8]
  end

  private

    # Increases each basic free card qty from 0 to 1
    def initialize_basic_card_qty
      self.collection_card_instances.each do |card|
        card.increment!(:quantity)
      end
    end
end
