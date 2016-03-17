class CollectionsController < ApplicationController
  def show
    @collection = current_user.collection
    @current_class = params[:current_class] || "Druid"
    gon.current_class = @current_class
    @cards = page_cards_with_class(@current_class)
  end
end
