module CollectionsHelper

  # Returns true if any cards not in current class, false if all same class
  def last_page_in_class?
    @cards.current_page == @cards.total_pages
  end

  # Returns current page of cards of specified class
  def page_cards_with_class(card_class)
    Card.with_class(card_class).page(params[:page]).per_page(8)
  end

end
