class CardsController < ApplicationController
  before_action :admin_user, only: [:new, :create]

  def new
  end

  def create
    card_data = card_params.fetch(:_json)
    card_data.each do |card|
      Card.create(card)
    end
    render 'new'
  end

  private

    def card_params
      params.permit(:_json => [:attack, :health, :name, :card_set, :rarity,
                               :image, :card_class, :card_type, :cost])
    end

    # Confirms an admin user
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
