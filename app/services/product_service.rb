class ProductService
	def self.create_product(product_attributes)
		product = Product.new(product_attributes)
		if product.save
			@result = Result.new(product,true)
		else
			@result = Result.new(product,false)
		end
	end

	def self.update_product(product, product_attributes)
		if product.update(product_attributes)
			Result.new(product, true)
		else
			Result.new(product, false)
		end
	end

	def self.index_product(search_params, page_params)
    	if search_params
      		@products = Product.order("created_at DESC").includes(:cartegory).search(search_params)
    	else
      		@products = Product.order("created_at DESC").includes(:cartegory)
    	end
   	 	@products = @products.page(page_params).per(4)
	end
	class Result
		attr_reader :product
		def initialize(product, success)
			@product = product
			@success = success
		end
		def success?
			@success
		end
	end
	private_constant :Result
end
