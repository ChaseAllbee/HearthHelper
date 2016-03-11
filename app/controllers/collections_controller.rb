class CollectionsController < ApplicationController
  def show
  	@collection ||= current_user.collection
  	@collection.current_class ||= @collection.class_list.first		# Default: Druid
  	@collection.class_ids ||= Card.with_class(@collection.current_class) 
  	@collection.page_ids ||= @collection.class_ids[0, 8]
  	@collection.first_card_id ||= Card.with_class(@collection.class_list.first).first
  	@collection.last_card_id ||= Card.with_class(@collection.class_list.last).last
  	@cards ||= Card.find(@collection.page_ids).sort_by(&:cost)
  end
end
