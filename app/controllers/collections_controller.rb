class CollectionsController < ApplicationController
  def show
    @collection = current_user.collection
    @normal_cards = normal_page_cards
    @collection.current_class = @normal_cards.first.card_class
    @cards = last_page_in_class? ? last_class_page_cards : @normal_cards
  end
end
