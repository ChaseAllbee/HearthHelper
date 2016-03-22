module CollectionsHelper

  # Returns true if last page in current class, false if Neutral
  def last_page_in_class?
     @current_class == "Neutral" ? false : @cards.current_page == @cards.total_pages
  end

  # Returns true if first page in current class, false if Druid
  def first_page_in_class?
    @current_class == "Druid" ? false : @cards.current_page == 1
  end

  # Returns current page of cards of current class
  def page_current_class_cards
    cards = Card.with_class(@current_class)
    page_num = params[:prev] ? last_page_num(cards) : params[:page]
    cards.page(page_num).per_page(8)
  end

  # Returns the number of the last page in the current class
  def last_page_num(cards)
    (cards.count / 8.to_f).ceil
  end

  # Returns true if user has entered anything into the search bar
  def searching?
    return true unless params[:search].nil?
  end

  # Returns search result cards matching search string
  def search_results
    Card.search(params[:search]).page(params[:page]).per_page(8)
  end

  # Returns true if card is in user's collection
  def owned_or_not(card)
    @owned.include?(card) ? "owned" : "not-owned"
  end

  # Returns the quantity of this card in user's collection
  def card_quantity(card)
    c = instance_of(card.id)
    c.nil? ? 0 : c.quantity
  end

  # Returns the collection instance of card
  def instance_of(card_id)
    @coll_card_instances.find_by(card_id: card_id)
  end

  # Returns true if incrementing or decrementing card quantity
  def pressed_arrow?
    return true unless params[:increment_or_decrement].nil?
  end

  # Increments or decrements card quantity; if incrementing from 0,
  # create card in collection, if decrementing from 1, destroy card
  def increment_or_decrement(incr_or_decr)
    if @owned.find_by(id: params[:card_id])
      incrementing?(incr_or_decr) ? increment : decrement_or_destroy
    else
      add_card_to_collection
    end
  end

  # Returns true if incrementing card quantity
  def incrementing?(incr_or_decr)
    incr_or_decr == "increment"
  end

  # Increments card quantity
  def increment
    @coll_card_instances.increment_qty(params[:card_id])
  end

  # Decrements card quantity or destroys card if 0 quantity
  def decrement_or_destroy
    @coll_card_instances.decrement_qty_or_destroy(params[:card_id])
  end

  # Adds card to collection
  def add_card_to_collection
    @collection.cards << Card.find(params[:card_id])
  end

  def delete_params
    params.delete :card_id
    params.delete :increment_or_decrement
    params.delete :prev
  end

end
