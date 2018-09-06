class ApplicationController < ActionController::Base
	def root_cartegories
		@cartegories = Cartegory.where(parent_id:0)
		@cartegories
	end
	helper_method :root_cartegories	
end
