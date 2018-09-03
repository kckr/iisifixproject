def create_vehicle_owners
  IisifixLogger.log 'Seeding Vehicle Owners !!!'

  (1..5).each do |i|
    vo = VehicleOwner.new first_name: "Vehicle#{i}", last_name: 'iisifix',
               email: "vehicle_owner#{i}@iisifix.fi", password: '!!s!f!x.f!', password_confirmation: '!!s!f!x.f!'
    vo.skip_confirmation!
    vo.save
    puts "Created Vehicle Owner => vehicle_owner#{i}@iisifix.fi"
  end
  IisifixLogger.log 'Vehicle Owners Seeded !!!'
end
