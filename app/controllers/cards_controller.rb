class CardsController < ApplicationController
  def new
  end

  def create
    params[:tester].each do |key, value|
      puts value
    end
    render 'new'
  end
end
