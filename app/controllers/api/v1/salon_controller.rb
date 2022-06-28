class Api::V1::SalonController < ApplicationController

  def get_salon_detials 
    resp = Salon.get_details(params)
    render json: resp, status: resp[:status]
  end

  def add_salon
    resp = Salon.add_salon(params)
    render json: resp, status: resp[:status]
  end

end