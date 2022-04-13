class PassengerMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def confirmation_email
    @booking = Booking.find(params[:id])
    @passenger = params[:passenger]
    @url = booking_url(@booking)
    mail to: @passenger.email,
         subject: "Booking Confirmation for Flight #{@booking.flight}"
  end
end
