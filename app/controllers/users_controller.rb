class UsersController < ApplicationController
  before_filter :authenticate, :except => [:new, :index, :create]
  before_filter :corr_user, :except => [:new, :index, :create]
  before_filter :is_admin, :only => [:index]
  before_filter :pick_user, :only => [:show, :edit, :update, :destroy]

  def pick_user
    @user = User.find(params[:id])
  end

  def corr_user
    if !current_user.admin
      mismatch_access unless correct_user(params[:id])
    end
  end

  def is_admin
    admin_access unless current_user.admin
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @props = @user.properties
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @title = " Login"
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
      if @user.save
        redirect_to root_path, notice: 'User was successfully created.'
      else
        render action: "new"
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
      if @user.update_attributes(params[:user])
        redirect_to @user, notice: 'User was successfully updated.'
      else
       render action: "edit" 
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
      redirect_to users_url 
    end
end
