module ApplicationHelper
	def root_cartegories
		@cartegories = Cartegory.where(parent_id:0).includes(:childrens)
	end
end
