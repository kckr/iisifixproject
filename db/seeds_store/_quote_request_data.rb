def load_quote_requests_data
  puts '-'.bold.yellow*80
  puts 'Seeding Quote Requests !!!'.green.bold

  vehicle_owner = VehicleOwner.first
  3.times do
    vehicle_owner.quote_request_lots.create
  end
  quote_request_lots = vehicle_owner.quote_request_lots
  quote_request_lots.each_with_index do |quote_request_lot, index|
    Garage.all.each do |garage|
      QuoteRequest.create(
        garage_id: garage.id,
        vehicle_owner_id: vehicle_owner.id,
        quote_request_lot_id: quote_request_lot.id,
        vehicle_info: {
          vehicle_registration_number: '123456789',
          vehicle_made_year: %w(2005 2006 2007)[index],
          vehicle_model: ['Ford 3ENF', 'Audi 200', 'Volkswagen 101'][index],
          vehicle_vendor_id: VehicleVendor.all.pluck(:id).sample,
          mileage: %w(3000 8000 5000)[index]
        },
        services_ids: Service.all.pluck(:id),
        additional_info: Faker::Lorem.paragraph,
        notify_via_sms: false,
        agree_quote_request_t_c: true,
        agree_katsastus_t_c: true,
        status: 1
      )
    end
  end

  IisifixLogger.log 'Quote Requests Seeded !!!'
end
