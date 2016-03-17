class CollectionsController < ApplicationController
  def show
    @collection = current_user.collection
    @current_class = params[:current_class] || "Druid"
    gon.current_class = @current_class
    if params[:prev_or_next_class] == "next"
      @cards = page_cards_with_class(@current_class)
      params.delete :prev_or_next_class
    else
      @cards = page_cards_with_class(@current_class)
    end
  end
end
