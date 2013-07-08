class PropertiesController < ApplicationController
  before_filter :authenticate, :except => [:index, :new, :create]
  before_filter :corr_user, :except => [:index, :new, :create]
  before_filter :pick_property, :only => [:show, :edit, :update, :destroy]

  def pick_property
    @property = Property.find(params[:id])
  end

  # GET /properties
  # GET /properties.json
  def index
    if current_user
      @properties = Property.search(params[:search], current_user.id)
    else
      @properties =Property.search(params[:search],0)
    end
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
  end

  # GET /properties/new
  # GET /properties/new.json
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = current_user.properties.new(params[:property])
      if @property.save
        redirect_to @property, notice: 'Property was successfully created.' 
      else
        render action: "new" 
      end
  end

  # PUT /properties/1
  # PUT /properties/1.json
  def update
      if @property.update_attributes(params[:property])
        redirect_to @property, notice: 'Property was successfully updated.' 
      else
        render action: "edit" 
      end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    redirect_to properties_url 
  end

  def corr_user
    mismatch_access unless correct_prop_user(params[:id])
  end

end
