# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require_relative 'seeds_store/_garages_data'
require_relative 'seeds_store/_payment_options_data'
require_relative 'seeds_store/_vehicle_vendor_data'
require_relative 'seeds_store/_services_data'

require_relative 'seeds_store/_vehicle_owners_data'
require_relative 'seeds_store/_quote_request_data'
require_relative 'seeds_store/_jobs_data'

# --------------------------------------------------
load_services_data
load_garages_data unless Rails.env.production?
load_payment_options_data
load_vehicle_vendor_data

create_vehicle_owners unless Rails.env.production?
load_quote_requests_data unless Rails.env.production?
load_jobs_data unless Rails.env.production?

IisifixLogger.log 'Setting Admin user...'
Admin.create!(first_name: 'Roshan', last_name: 'Upreti',
              email: 'admin@iisifix.fi',
              password: 'iisifixnilgiri8090',
              password_confirmation: 'iisifixnilgiri8090',
              confirmed_at: Time.now)

IisifixLogger.log 'All the seeds have been planted successfully!!!'
