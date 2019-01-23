class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  helper ProjectsHelper

  # GET /projects
  # GET /projects.json
  def index
    puts "Projects@index"
    @customer = Customer.find(params[:customer_id])
    @projects = @customer.projects

  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    puts "Projects@show"
    @customer = Customer.find(params[:customer_id])
    if params[:active_tab].present?
      @active_tab = params[:active_tab]
    end
  end

  # GET /projects/new
  def new
    puts "Project@new"
    @customer = Customer.find(params[:customer_id])
    #@project = @customer.projects.create(project_params)
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    puts "Project#EDIT"
    @customer = Customer.find(params[:customer_id])
    @project = @customer.projects.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    puts "CReATE in projects controller"
    @customer = Customer.find(params[:customer_id])
    @project = @customer.projects.create(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to customer_projects_path(@customer), notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @customer = Customer.find(params[:customer_id])
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to customer_path(@customer), notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @customer = Customer.find(params[:customer_id])
    @project.destroy
    respond_to do |format|
      format.html { redirect_to customer_path(@customer), notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :oracleID)
    end
end
