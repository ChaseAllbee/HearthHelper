module CollectionsHelper

  # Returns true if last page in current class, false if Neutral
  def last_page_in_class?
     @current_class == "Neutral" ? false : @cards.current_page == @cards.total_pages
  end

  # Returns true if first page in current class, false if Druid
  def first_page_in_class?
    @current_class == "Druid" ? false : @cards.current_page == 1
  end

  # Returns current page of cards of specified class
  def page_current_class_cards
    Card.with_class(@current_class).page(params[:page]).per_page(8)
  end

end
