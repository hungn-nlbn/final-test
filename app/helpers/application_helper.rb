module ApplicationHelper
	def root_cartegories
		@root_cartegories = Cartegory.where(parent_id:0)
	end
end
