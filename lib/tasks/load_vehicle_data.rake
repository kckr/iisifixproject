desc 'Loads data from db/vehicles.csv file to vehicles table'
task :load_vehicle_data => :environment do
  IisifixLogger.log('Starting to load the vehicle data from db/vehicles.csv ...')
  Vehicle.import!
  IisifixLogger.log('Done loading the vehicle data from db/vehicles.csv!')
end
