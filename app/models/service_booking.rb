class ServiceBooking < ApplicationRecord

  def self.book_service(params)
    resp = {:status => 400, :result => nil}
    booking_params = params.permit(:customer_name, :mobile, :service_id)
    salon_id = Service.find(params[:service_id]).salon_id
    salon = Salon.find(salon_id)
    seats = salon.total_chairs
    workSchedule = WorkSchedule.find_by(salon_id: salon_id, week_day_id: params[:week_day_id], time_slot_id: params[:time_slot_id])
    bookedSeats = ServiceBooking.where(work_schedule_id: workSchedule.id, status: 1).count
    booking_params[:work_schedule_id] = workSchedule.id
    if seats > bookedSeats 
      booking = ServiceBooking.new(booking_params)
      if booking.save!
        resp[:result] = "Booking Confirmed. "
        resp[:status] = 201
      end
    else
      resp[:result] = "Selected slot is booked. "
      resp[:status] = 200
    end
    return resp
  rescue => error
		logger.error "Error Occured in ServiceBooking.book_service: #{error}\n"
		resp = "Error occured: #{error}"
		return resp
  end

  def self.cancel_booking(params)
    resp = {:status => 400, :result => nil}
    booking = ServiceBooking.find(params[:booking_id])
    if booking.present?
      booking.update(status: 0)
      resp[:result] = "Booking Cancelled. "
      resp[:status] = 201
    end
    return resp
  rescue => error
		logger.error "Error Occured in ServiceBooking.cancel_booking: #{error}\n"
		resp = "Error occured: #{error}"
		return resp
  end

  def self.view_report(params)
    resp = {:status => 400, :result => nil}
    serviceCount = ServiceBooking.joins("inner join services where services.id = service_bookings.service_id").select("services.name, services.price,service_bookings.*").group(:service_id, :status).map(&:serializable_hash)
    out = {}
    serviceCount.each do |service|
      p service
    end
    # resp[:total] = service.count
    # resp[:revenue_lost] = service.where(status: 1)
    # resp[:revenue_earned] = service.where(status: 0)
    return resp
  rescue => error
		logger.error "Error Occured in ServiceBooking.cancel_booking: #{error}\n"
		resp = "Error occured: #{error}"
		return resp
  end

end