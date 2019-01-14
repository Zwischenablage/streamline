class ParamSetsController < ApplicationController
  before_action :set_param_set, only: [:show, :edit, :update, :destroy]

  # GET /param_sets
  # GET /param_sets.json
  def index
    puts "--> ParamSets#index"
    #@param_sets = ParamSet.all

    puts "YAML::: " + params.to_yaml
    if params[:search_param_sets].present?
      puts "Received Query: " + params[:search_param_sets][:query]
      #@current_page = (search_params[:page] || 1).to_i
      #@total_pages = (RubyGem.count / PAGE_SIZE.to_f).ceil
      #page_offset = (@current_page - 1) * PAGE_SIZE
      #@search_results = RubyGem.order(:created_at).limit(PAGE_SIZE).offset(page_offset)
      search()
    end
  end

  def search
    puts "--> ParamSets#search"
    puts "YAML: " + params.to_yaml
    query = params[:search_param_sets].presence && params[:search_param_sets][:query]

    if query
      puts "Calling SEARCH... "
      @param_sets = ParamSet.search query, highlight: true
      @param_sets.inspect
      @query = query
    end
  end

  # GET /param_sets/1
  # GET /param_sets/1.json
  def show
    puts "--> ParamSets#show"
  end

  # GET /param_sets/new
  def new
    puts "--> ParamSets#new"
    @param_set = ParamSet.new
  end

  # GET /param_sets/1/edit
  def edit
    puts "--> ParamSets#edit"
  end

  # POST /param_sets
  # POST /param_sets.json
  def create
    puts "--> ParamSets#create"
    @param_set = ParamSet.new(param_set_params)

    respond_to do |format|
      if @param_set.save
        format.html { redirect_to @param_set, notice: 'Param set was successfully created.' }
        format.json { render :show, status: :created, location: @param_set }
      else
        format.html { render :new }
        format.json { render json: @param_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /param_sets/1
  # PATCH/PUT /param_sets/1.json
  def update
    respond_to do |format|
      if @param_set.update(param_set_params)
        format.html { redirect_to @param_set, notice: 'Param set was successfully updated.' }
        format.json { render :show, status: :ok, location: @param_set }
      else
        format.html { render :edit }
        format.json { render json: @param_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /param_sets/1
  # DELETE /param_sets/1.json
  def destroy
    @param_set.destroy
    respond_to do |format|
      format.html { redirect_to param_sets_url, notice: 'Param set was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_param_set
      @param_set = ParamSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def param_set_params
      params.require(:param_set).permit(:query, :projectName, :productName, :productVersion, :mode, :tuneProject)
    end
end
