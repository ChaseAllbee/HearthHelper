module CollectionsHelper

  # Returns true if any cards not in current class, false if all same class
  def last_page_in_class?
    @cards.current_page == @cards.total_pages
  end

  # Returns current page of cards of specified class
  def page_cards_with_class(card_class)
    Card.with_class(card_class).page(params[:page]).per_page(8)
  end

  # Returns an array of classes [Druid, Hunter,..., Neutral]
  def class_list
   %w(Druid Hunter Mage Paladin Priest Rogue Shaman Warlock Warrior Neutral)
  end

  # Returns name of next class
  def next_class
    class_idx = class_list.find_index(@collection.current_class) + 1
    @collection.current_class = class_list[class_idx]
  end

  # Returns name of previous class
  def prev_class
    class_idx = class_list.find_index(@collection.current_class) - 1
    @collection.current_class = class_list[class_idx]
  end

end
