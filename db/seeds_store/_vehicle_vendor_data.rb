
def load_vehicle_vendor_data
  IisifixLogger.log 'Preparing Vehicle Vendor data to load ...'
  file = File.expand_path('../../vehicle_vendor_list.json', __FILE__)
  data = JSON.parse(File.read(file))
  payload = []
  data.each do |country, vendors|
    payload << vendors.map do |vendor|
      {
          name: vendor,
          country: country
      }
    end
  end

  IisifixLogger.log 'Uploading Vehicle Vendor data to database ...'
  VehicleVendor.create payload

  IisifixLogger.log 'Vehicle Vendor data Loaded !!!'
end
