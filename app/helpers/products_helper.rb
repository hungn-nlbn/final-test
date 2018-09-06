module ProductsHelper
	def root_cartegories
		@data = Cartegory.where(parent_id:0)
	end
end
