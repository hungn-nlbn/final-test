class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
      @page_title = "ProductManager|Products"
      @products = ProductService.index_product(params[:search], params[:page])
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @page_title = "ProductManage|Products Details"
  end

  # GET /products/new
  def new
    @product = Product.new
    @page_title = "ProductManage|New Product"
  end

  # GET /products/1/edit
  def edit
      @page_title = "ProductManage|Edit Product"
  end

  # POST /products
  # POST /products.json
  def create
      result = ProductService.create_product(product_params)
      if result.success?
        redirect_to products_url
      else
        @product = result.product
        render :new
      end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
      result = ProductService.update_product(@product, product_params)
      if result.success?
        redirect_to products_url
      else
        @product = result.product
        render :edit
      end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :parent_id, :price)
    end
end
