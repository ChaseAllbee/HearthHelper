class DecksController < ApplicationController
  def index
    month = Date.today.strftime("%B")
    @meta_decks = ExternalDeck.where(tier: 1).where("name LIKE ?", "%#{month}%")
  end

  def new
  end
end
