def seed_services
  Service.create(salon_id: 1, name: 'Service1', price: 101.50,time_taken:40 )
  Service.create(salon_id: 1, name: 'Service2', price: 131.50,time_taken:20 )
  Service.create(salon_id: 1, name: 'Service3', price: 171.50,time_taken:10 )
  Service.create(salon_id: 2, name: 'Service1', price: 110.50,time_taken:30 )
  Service.create(salon_id: 2, name: 'Service4', price: 21.50,time_taken:45 )
end