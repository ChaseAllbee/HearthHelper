class CollectionsController < ApplicationController
  def show
  	@druid_ids = Card.with_class("Druid").pluck(:id)
  end
end
