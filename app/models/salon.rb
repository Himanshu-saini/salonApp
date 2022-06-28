class Salon < ApplicationRecord

  def self.get_details(params)
    resp = {:status => 400, :result => nil}
    salon = Salon.all
    salon = salon.where("company_name like '%#{params[:name]}%'") if params[:name].present?
    resp[:count] = salon.count
    params[:limit] = (params[:limit].nil?) ? 10:params[:limit].to_i
    params[:offset] = (params[:offset].nil?) ? 0:params[:offset].to_i
    resp[:result] = salon.select(:id, :company_name,:PAN_no,:address,:total_chairs).limit(params[:limit]).offset(params[:offset]).map(&:serializable_hash)
    resp[:click_more] = (params[:offset]+params[:limit]>=resp[:count])? false : true
    resp[:status] = 200
    return resp
  rescue => error
		logger.error "Error Occured in Salon.get_details: #{error}\n"
		resp = "Error occured: #{error}"
		return resp
  end

  def self.add_salon(params)
    resp = {:status => 400, :message => nil}
    salon_params = params.permit(:company_name,:PAN_no,:address,:total_chairs)
    salon = Salon.new(salon_params)
    if salon.save!
      resp[:message] = "Salon created Successfully. "
      resp[:status] = 201
		end
    return resp
  rescue => error
    logger.error "Error occured in Salon.add_salon: #{error}"
    resp[:message] = "Error occured: #{error}"
    return resp
  end

end