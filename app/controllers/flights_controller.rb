class FlightsController < ApplicationController

  def index
    if params.has_key?(:day) && params.has_key?(:month) && params.has_key?(:year)
      if params[:departure_airport_id].blank?
        flash.now[:alert] = "Departure airport is missing"
      elsif params[:arrival_airport_id].blank?
        flash.now[:alert] = "Destination airport is missing"
      elsif params[:pass].blank?
        flash.now[:alert] = "Please choose the number of passengers"
      elsif params[:departure_airport_id] == params[:arrival_airport_id]
        flash.now[:alert] = "Please check your input"
      else
        @selected_date = Date.civil(params[:year].to_i, params[:month].to_i, params[:day].to_i)
        @available_flights= Flight.where(departure_airport_id: params[:departure_airport_id], arrival_airport_id: params[:arrival_airport_id], start: @selected_date.all_day)
      end
    end
  end
end

private
 def flight_params
   params.require(:flight).permit(:duration, :start, :arrival_airport_id, :departure_airport_id)
end
