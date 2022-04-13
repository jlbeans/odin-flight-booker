class BookingsController < ApplicationController

  def new
    @booking= Booking.new
    @selected_flight= Flight.find(params[:flight])
    @passenger_number= params[:pass].to_i
    @passenger_number.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      @passengers = @booking.passengers

      @passengers.each do |p|
        PassengerMailer.with(passenger: p, id: @booking.id).confirmation_email.deliver_later
      end

      flash[:notice]= "Booking complete!"
      redirect_to booking_path(@booking)
    else
      flash[:alert]= "Oops, an error has occured!"
      render "new"
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end



  private
    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
    end
 end
