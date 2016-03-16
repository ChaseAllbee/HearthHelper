module CollectionsHelper

  # Returns true if any cards not in current class, false if all same class
  def last_page_in_class?
    @class_cards = class_ids
    @page_cards = @normal_cards.pluck(:id)
    all_same_class = @page_cards.all? { |card| @class_cards.include?(card) }
    !all_same_class
  end

  # Returns ids of all cards in current class
  def class_ids
    Card.with_class(@collection.current_class).pluck(:id)
  end

  # Returns last class page with limit set to slice size
  def last_class_page_cards
    Card.all_playable.page(params[:page]).per_page(page_slice_size)
  end

  # Returns current page of cards with normal limit of 8
  def normal_page_cards
    Card.all_playable.page(params[:page]).per_page(8)
  end

  # Returns slice size for last class page
  def page_slice_size
    @page_cards.index { |card| !@class_cards.include?(card) }
  end

end
