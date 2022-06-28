class Api::V1::ServiceController < ApplicationController

  def get_salon_services
    resp = Service.get_services(params)
    render json: resp, status: resp[:status]
  end

  def add_salon_service
    resp = Service.add_services(params)
    render json: resp, status: resp[:status]
  end

  def book_service
    resp = ServiceBooking.book_service(params)
    render json: resp, status: resp[:status]
  end
  def cancel_service
    resp = ServiceBooking.cancel_booking(params)
    render json: resp, status: resp[:status]
  end

  def get_services_report
    resp = ServiceBooking.view_report(params)
    render json: resp, status: resp[:status]
  end

end