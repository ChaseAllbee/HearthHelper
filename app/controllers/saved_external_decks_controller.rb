class SavedExternalDecksController < ApplicationController

  def create
    @deck = ExternalDeck.find(params[:deck_id])
    current_user.save(@deck)
    respond_to do |format|
      format.html { redirect_to @deck }
      format.js
    end
  end

  def destroy
    @deck = SavedExternalDeck.find_by(params[:id])
    current_user.unsave(@deck)
    respond_to do |format|
      format.html { redirect_to deck_path(deck.external_deck_id) }
      format.js
    end
  end
end
