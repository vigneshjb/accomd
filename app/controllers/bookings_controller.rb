class BookingsController < ApplicationController
  before_filter :authenticate, :except => [ :create]
  before_filter :corr_user, :except => [:index,:new,:create, :manage]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings=current_user.bookings
  end

  def manage
    @ids = current_user.property_ids
    @bookings=Booking.where('property_id in (?)',@ids ) 
    # @bookings= Select * from bookings where property_id in (Select id from `properties` where user_id='3')
  end


  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @booking = Booking.find(params[:id])
  end

  # GET /bookings/new
  # GET /bookings/new.json
  def new
    @property = Property.find(params[:property_id])
    @prop_Loc = @property.location
    @booking=@property.bookings.build(params[:booking])
  end

  def create
    params[:booking][:user_id]=current_user.id
    if !!Booking.validate(params[:booking][:from],params[:booking][:to], params[:property_id])
      redirect_to root_path, alert: 'Property not available on the given dates'
    else
      params[:booking][:from]=Date.strptime(params[:booking][:from], "%m/%d/%Y")
      params[:booking][:to]=Date.strptime(params[:booking][:to], "%m/%d/%Y")
      @booking = Property.find(params[:property_id]).bookings.build(params[:booking])
        if @booking.save
          redirect_to bookings_path, notice: 'Booking was successfully created.' 
        else
          render action: "new"
        end
    end
  end


  def edit
    @property = Property.find(params[:property_id])
    @booking=@property.bookings.find(params[:id])
  end


  def update
    @property = Property.find(params[:property_id])
    @booking=@property.bookings.find(params[:id])
    if Booking.validate(params[:booking][:from],params[:booking][:to],params[:property_id])
      redirect_to root_path, alert: 'Property not available on the given dates'
    else
      params[:booking][:from]=Date.strptime(params[:booking][:from], "%m/%d/%Y")
      params[:booking][:to]=Date.strptime(params[:booking][:to], "%m/%d/%Y")
      if @booking.update_attributes(params[:booking])
        redirect_to root_path, notice: 'Booking was successfully updated.' 
      else
         render action: "edit"
      end
    end
  end


  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_url 
  end

end
