class SessionTypesController < ApplicationController
  before_action :set_session_type, only: [:show, :edit, :update, :destroy]

  # GET /session_types
  # GET /session_types.json
  def index
    @session_types = SessionType.all
  end

  # GET /session_types/1
  # GET /session_types/1.json
  def show
  end

  # GET /session_types/new
  def new
    @session_type = SessionType.new
  end

  # GET /session_types/1/edit
  def edit
  end

  # POST /session_types
  # POST /session_types.json
  def create
    @session_type = SessionType.new(session_type_params)

    respond_to do |format|
      if @session_type.save
        format.html { redirect_to @session_type, notice: 'Session type was successfully created.' }
        format.json { render :show, status: :created, location: @session_type }
      else
        format.html { render :new }
        format.json { render json: @session_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /session_types/1
  # PATCH/PUT /session_types/1.json
  def update
    respond_to do |format|
      if @session_type.update(session_type_params)
        format.html { redirect_to @session_type, notice: 'Session type was successfully updated.' }
        format.json { render :show, status: :ok, location: @session_type }
      else
        format.html { render :edit }
        format.json { render json: @session_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /session_types/1
  # DELETE /session_types/1.json
  def destroy
    @session_type.destroy
    respond_to do |format|
      format.html { redirect_to session_types_url, notice: 'Session type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session_type
      @session_type = SessionType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_type_params
      params.require(:session_type).permit(:type)
    end
end
