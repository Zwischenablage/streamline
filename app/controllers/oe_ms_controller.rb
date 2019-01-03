class OeMsController < ApplicationController
  before_action :set_oem, only: [:show, :edit, :update, :destroy]

  # GET /oems
  # GET /oems.json
  def index
    @oems = Oem.all
  end

  # GET /oems/1
  # GET /oems/1.json
  def show
  end

  # GET /oems/new
  def new
    @oem = Oem.new
  end

  # GET /oems/1/edit
  def edit
  end

  # POST /oems
  # POST /oems.json
  def create
    @oem = Oem.new(oem_params)

    respond_to do |format|
      if @oem.save
        format.html { redirect_to @oem, notice: 'Oem was successfully created.' }
        format.json { render :show, status: :created, location: @oem }
      else
        format.html { render :new }
        format.json { render json: @oem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oems/1
  # PATCH/PUT /oems/1.json
  def update
    respond_to do |format|
      if @oem.update(oem_params)
        format.html { redirect_to @oem, notice: 'Oem was successfully updated.' }
        format.json { render :show, status: :ok, location: @oem }
      else
        format.html { render :edit }
        format.json { render json: @oem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oems/1
  # DELETE /oems/1.json
  def destroy
    @oem.destroy
    respond_to do |format|
      format.html { redirect_to oems_url, notice: 'Oem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oem
      @oem = Oem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def oem_params
      params.require(:oem).permit(:name)
    end
end
