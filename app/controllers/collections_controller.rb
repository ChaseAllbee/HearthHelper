class CollectionsController < ApplicationController
  def show
    @collection = current_user.collection
    @cards = page_cards_with_class(params[:card_class] ||= "Druid")
  end
end
