class SessionsController < ApplicationController
  helper SessionsHelper
  before_action :set_session, only: [:show, :edit, :update, :destroy, :project_files]

  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = Session.all
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
    puts "Session#SHOW"
    @customer = Customer.find(params[:customer_id])
    @project = Project.find(params[:project_id])
  end

  # GET /sessions/new
  def new
    puts "Session#NEW"
    @customer = Customer.find(params[:customer_id])
    @project = Project.find(params[:project_id])
    @session = Session.new
    @paramset = @session.param_sets.build
    @paramset.value_sets.build
    #@session.paramsets.build


  end

  # GET /sessions/1/edit
  def edit
    @customer = Customer.find(params[:customer_id])
    @project = @customer.projects.find(params[:project_id])
    @session = @project.sessions.find(params[:id])
    #@paramset = @session.param_sets.find(params[:id])
  end

  # POST /sessions
  # POST /sessions.json
  def create
    puts "Session#CREATE"
    @customer = Customer.find(params[:customer_id])
    @project = @customer.projects.find(params[:project_id])
    @session = @project.sessions.create(session_params)
    @session.param_sets.create


    #doc = Nokogiri::XML.parse(File.open("test.tproj")
    parseTuneProject

    #puts "HUHU\n" + params[:paramsets].to_yaml
    #puts "!!!session\n" + @ssesion.to_yaml
    #@paramset = @session.param_sets.create(param_set_params)
    #@paramset.save

    respond_to do |format|
      if @session.save
        format.html { redirect_to customer_project_path(@customer, @project), notice: 'Session was successfully created.' }
        format.json { render :show, status: :created, location: @session }
      else
        format.html { render :new }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sessions/1
  # PATCH/PUT /sessions/1.json
  def update
    puts "Session#Update"
    @customer = Customer.find(params[:customer_id])
    @project = @customer.projects.find(params[:project_id])
    @session = @project.sessions.find(params[:id])

    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to customer_project_path(@customer, @project), notice: 'Session was successfully updated.' }
        format.json { render :show, status: :ok, location: @session }
      else
        format.html { render :edit }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @customer = Customer.find(params[:customer_id])
    @project = Project.find(params[:project_id])
    @session.destroy
    respond_to do |format|
      format.html { redirect_to customer_project_path(@customer, @project), notice: 'Session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require(:session).permit(:session_type, :description, :finished_at, :vehicle, :state, :tuneProject, :project_file, param_sets_attributes: [:productName, :productVersion, :mode, :id] )
    end

    def parseTuneProject
      filename = "./tproj/" + params[:session]["project_file"]
      puts "FFFF filename = " + filename
      doc = Nokogiri::XML(File.open(filename))

      @session.param_sets[0].projectName = doc.xpath("tuneproject/name").text
      @session.param_sets[0].productVersion = doc.xpath("//library/libversion").text
      @session.param_sets[0].productName = doc.xpath("//library/libname").text
      @session.param_sets[0].mode = doc.xpath("//library/libmode").text
      #@session.param_sets[0].tuneProject =  doc.xpath("//valueset")

      doc.xpath("//paramset/valueset").each do |valueSet|
        #puts "Name: " + value["name"] + ", = " + value.xpath("field")[0].text
        vs = @session.param_sets[0].value_sets.build
        vs.name = valueSet.xpath("name").text
        vs.comment = valueSet.xpath("comment")[0].present? ? valueSet.xpath("comment")[0].text : ""
        vs.shortComment = valueSet.xpath("shortcomment")[0].present? ? valueSet.xpath("shortcomment")[0].text : ""

        valueSet.xpath("value").each do |parameter|
          p = vs.parameters.build
          p.name = parameter["name"]
          p.value = parameter.xpath("field")[0].text
        end
      end

    #  doc.xpath("//valueset/value").each do |value|
        #puts "Name: " + value["name"] + ", = " + value.xpath("field")[0].text
      #  vs = @session.param_sets[0].value_sets.build
      #  vs.name = value["name"]
      #  vs.value = value.xpath("field")[0].text
      #  vs.comment = value.xpath("comment")[0].present? ? value.xpath("comment")[0].text : ""
        #vs.shortComment = ""
      #end


      puts "!!!session\n" + @ssesion.to_yaml

      #puts " !!!! Count : "  + block.count.to_s
      #puts "ParamSet[0]: " + @session.param_sets[0].to_yaml

    end


end
