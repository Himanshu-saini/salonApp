class Service < ApplicationRecord
  has_one :Salon

  def self.get_services(params)
    resp = {:status => 400, :result => nil}
    service = Service.joins("inner join work_schedules WS on WS.salon_id = services.salon_id") .group("services.id, WS.week_day_id")
    service = service.where(salon_id: params[:salon_id]) if params[:salon_id].present?
    params[:limit] = (params[:limit].nil?) ? 10:params[:limit].to_i
    params[:offset] = (params[:offset].nil?) ? 0:params[:offset].to_i
    resp[:result] = service.select("services.id, services.name, services.price, services.time_taken,WS.week_day_id, GROUP_CONCAT(WS.time_slot_id ) as time_slots")
    
    resp[:status] = 200
    return resp
  rescue => error
		logger.error "Error Occured in Service.get_services: #{error}\n"
		resp = "Error occured: #{error}"
		return resp
  end

  def self.add_services(params)
    resp = {:status => 400, :message => nil}
    service_params = params.permit(:salon_id,:name,:price,:time_taken)
    salon = Salon.find(params[:salon_id])
    service = Service.new(service_params)
    if service.save!
      resp[:message] = "Salon Service created Successfully. "
      resp[:status] = 201
		end
    return resp
  rescue => error
    logger.error "Error occured in Service.add_services: #{error}"
    resp[:message] = "Error occured: #{error}"
    return resp
  end

end