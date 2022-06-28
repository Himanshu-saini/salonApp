# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require_relative './data/weekdays.rb'
require_relative './data/timeslots.rb'
require_relative './data/salons.rb'
require_relative './data/services.rb'
require_relative './data/work_schedule.rb'
require_relative './data/service_booking.rb'

p "Seeding Data ..."
# seed_weekdays
# seed_timeslots
# seed_salons
# seed_services
# seed_workschedule
seed_servicebookings
p "End Seeding!"