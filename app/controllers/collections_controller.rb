class CollectionsController < ApplicationController
  include CollectionsHelper
  before_action :logged_in_user

  def show
    @collection = current_user.collection
    @coll_card_instances = @collection.collection_card_instances
    @owned = @collection.cards.where("cost >= ?", 0)
    @current_class = params[:current_class] || "Druid"
    gon.current_class = @current_class
    @cards = searching? ? search_results : page_current_class_cards
    increment_or_decrement(params[:increment_or_decrement]) if pressed_arrow?
    gon.current_page = params[:page]
  end

end
