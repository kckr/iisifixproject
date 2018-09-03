def load_jobs_data
  puts '-'.bold.yellow*80
  puts 'Seeding Jobs !!!'.green.bold

  vehicle_owner = VehicleOwner.first
  quote_request_lots = vehicle_owner.quote_request_lots
  quote_request_lots.each_with_index do |quote_request_lot, index|
    approving_quote_request = quote_request_lot.quote_requests.sample
    approving_quote_request.update_attributes(
      status: 'responded',
      warranty_offer: ['3 Months', '200 Km', '500 Km'][index],
      quoted_amount: %w(400.00 300.00 900.00)[index],
      proposed_start_date: 10.days.from_now,
      proposed_end_date: 20.days.from_now
      )
    approving_quote_request.accepted!
    approving_quote_request.create_job
  end

  IisifixLogger.log 'Jobs seeded !!!'

end
