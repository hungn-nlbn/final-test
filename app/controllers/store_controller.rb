class StoreController < ApplicationController
  def index
  	@cartegories = Cartegory.where(parent_id:0)
  end
end
