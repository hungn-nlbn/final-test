class CartegoriesController < ApplicationController
  before_action :set_cartegory, only: [:show, :edit, :update, :destroy]

  # GET /cartegories
  # GET /cartegories.json
  def index
    @cartegories = Cartegory.all
  end

  # GET /cartegories/1
  # GET /cartegories/1.json
  def show
  end

  # GET /cartegories/new
  def new
    @cartegory = Cartegory.new
  end

  # GET /cartegories/1/edit
  def edit
  end

  # POST /cartegories
  # POST /cartegories.json
  def create
    @cartegory = Cartegory.new(cartegory_params)

    respond_to do |format|
      if @cartegory.save
        format.html { redirect_to @cartegory, notice: 'Cartegory was successfully created.' }
        format.json { render :show, status: :created, location: @cartegory }
      else
        format.html { render :new }
        format.json { render json: @cartegory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cartegories/1
  # PATCH/PUT /cartegories/1.json
  def update
    respond_to do |format|
      if @cartegory.update(cartegory_params)
        format.html { redirect_to @cartegory, notice: 'Cartegory was successfully updated.' }
        format.json { render :show, status: :ok, location: @cartegory }
      else
        format.html { render :edit }
        format.json { render json: @cartegory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cartegories/1
  # DELETE /cartegories/1.json
  def destroy
    @cartegory.destroy
    respond_to do |format|
      format.html { redirect_to cartegories_url, notice: 'Cartegory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cartegory
      @cartegory = Cartegory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cartegory_params
      params.require(:cartegory).permit(:name, :parent_id)
    end
end
