class AdminController < ApplicationController
  layout "admin"
  def index
  	@page_title = "ProductManager | Admin"
  end
end
