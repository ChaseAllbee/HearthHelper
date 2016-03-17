class CollectionsController < ApplicationController
  def show
    @collection = current_user.collection
    @current_class = params[:current_class] || "Druid"
    gon.current_class = @current_class
    @cards = page_current_class_cards
    gon.last_page_num = @cards.total_pages
  end
end
