class AccomadationsController < ApplicationController
  # GET /accomadations
  # GET /accomadations.json
  def index
    @accomadations = Accomadation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accomadations }
    end
  end

  # GET /accomadations/1
  # GET /accomadations/1.json
  def show
    @accomadation = Accomadation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @accomadation }
    end
  end

  # GET /accomadations/new
  # GET /accomadations/new.json
  def new
    @accomadation = Accomadation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @accomadation }
    end
  end

  # GET /accomadations/1/edit
  def edit
    @accomadation = Accomadation.find(params[:id])
  end

  # POST /accomadations
  # POST /accomadations.json
  def create
    @accomadation = Accomadation.new(params[:accomadation])

    respond_to do |format|
      if @accomadation.save
        format.html { redirect_to @accomadation, notice: 'Accomadation was successfully created.' }
        format.json { render json: @accomadation, status: :created, location: @accomadation }
      else
        format.html { render action: "new" }
        format.json { render json: @accomadation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accomadations/1
  # PUT /accomadations/1.json
  def update
    @accomadation = Accomadation.find(params[:id])

    respond_to do |format|
      if @accomadation.update_attributes(params[:accomadation])
        format.html { redirect_to @accomadation, notice: 'Accomadation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @accomadation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accomadations/1
  # DELETE /accomadations/1.json
  def destroy
    @accomadation = Accomadation.find(params[:id])
    @accomadation.destroy

    respond_to do |format|
      format.html { redirect_to accomadations_url }
      format.json { head :no_content }
    end
  end
end
