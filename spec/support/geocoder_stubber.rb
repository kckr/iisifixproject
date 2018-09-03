# Note: this stubber works for
# - Geocoder.coordinates
# - Geocoder.search
# but did not work for `geocoded_by` or `reverse_geocoded_by` hooks in Models
# So, in `geocodable.rb` those hooks are put off for Test Env and in
#   factory `garages.rb` coordinates are recalculated.
module GeocoderStubber
  MockData = [["Sankhamul Bridge, Patan 44600, Nepal",
               [{ "latitude"     => 27.680442,
                  "longitude"    => 85.3305714,
                  "address"      => "Sankhamul Bridge, Patan 44600, Nepal",
                  "state"        => "Central Development Region",
                  "state_code"   => "Central Development Region",
                  "country"      => "Nepal",
                  "country_code" => "NP" }]],
              ["Chakupat Rd, Patan 44600, Nepal",
               [{ "latitude"     => 27.682243,
                  "longitude"    => 85.32753629999999,
                  "address"      => "Chakupat Rd, Patan 44600, Nepal",
                  "state"        => "Central Development Region",
                  "state_code"   => "Central Development Region",
                  "country"      => "Nepal",
                  "country_code" => "NP" }]],
              ["Patan Dhoka, Patan 44600, Nepal",
               [{ "latitude"     => 27.6791202,
                  "longitude"    => 85.321376,
                  "address"      => "Patan Dhoka, Patan 44600, Nepal",
                  "state"        => "Central Development Region",
                  "state_code"   => "Central Development Region",
                  "country"      => "Nepal",
                  "country_code" => "NP" }]],
              ["Patan Sundhara, Patan, Nepal",
               [{ "latitude"     => 27.669182,
                  "longitude"    => 85.33042119999999,
                  "address"      => "Patan Sundhara, Patan, Nepal",
                  "state"        => "Central Development Region",
                  "state_code"   => "Central Development Region",
                  "country"      => "Nepal",
                  "country_code" => "NP" }]],
              ["Sundhara, Kathmandu 44600, Nepal",
               [{ "latitude"     => 27.7000078,
                  "longitude"    => 85.311683,
                  "address"      => "Sundhara, Kathmandu 44600, Nepal",
                  "state"        => "Central Development Region",
                  "state_code"   => "Central Development Region",
                  "country"      => "Nepal",
                  "country_code" => "NP" }]],
              ["New Rd, Kathmandu 44600, Nepal",
               [{ "latitude"     => 27.7033426,
                  "longitude"    => 85.3115765,
                  "address"      => "New Rd, Kathmandu 44600, Nepal",
                  "state"        => "Central Development Region",
                  "state_code"   => "Central Development Region",
                  "country"      => "Nepal",
                  "country_code" => "NP" }]],
              ["Thankot, Chandragiri 44619, Nepal",
               [{ "latitude"     => 27.686766,
                  "longitude"    => 85.2023569,
                  "address"      => "Thankot, Chandragiri 44619, Nepal",
                  "state"        => "Central Development Region",
                  "state_code"   => "Central Development Region",
                  "country"      => "Nepal",
                  "country_code" => "NP" }]],
              ["Bhaktapur Nala Rd, Nepal",
               [{ "latitude"     => 27.6674402,
                  "longitude"    => 85.4737983,
                  "address"      => "Bhaktapur Nala Rd, Nepal",
                  "state"        => "Central Development Region",
                  "state_code"   => "Central Development Region",
                  "country"      => "Nepal",
                  "country_code" => "NP" }]],
              ["Milan Chowk, Butwal 32907, Nepal",
               [{ "latitude"     => 27.6895723,
                  "longitude"    => 83.46368830000002,
                  "address"      => "Milan Chowk, Butwal 32907, Nepal",
                  "state"        => "Mid-Western Development Region",
                  "state_code"   => "Mid-Western Development Region",
                  "country"      => "Nepal",
                  "country_code" => "NP" }]],
              ["Siddharthanagar, Nepal",
               [{ "latitude"     => 27.5065119,
                  "longitude"    => 83.43767489999999,
                  "address"      => "Siddharthanagar, Nepal",
                  "state"        => "Mid-Western Development Region",
                  "state_code"   => "Mid-Western Development Region",
                  "country"      => "Nepal",
                  "country_code" => "NP" }]],
              ["Khaireni, Devdaha Municipality 32900, Nepal",
               [{ "latitude"     => 27.6453186,
                  "longitude"    => 83.5949262,
                  "address"      => "Khaireni, Devdaha Municipality 32900, Nepal",
                  "state"        => "Mid-Western Development Region",
                  "state_code"   => "Mid-Western Development Region",
                  "country"      => "Nepal",
                  "country_code" => "NP" }]],
              ["Sunwal, Nepal",
               [{ "latitude"     => 27.6271937,
                  "longitude"    => 83.64548309999999,
                  "address"      => "Sunwal, Nepal",
                  "state"        => "Mid-Western Development Region",
                  "state_code"   => "Mid-Western Development Region",
                  "country"      => "Nepal",
                  "country_code" => "NP" }]],
              ["New York, NY, USA",
               [{ "latitude" => 40.7127837, "longitude" => -74.0059413, "address" => "New York, NY, USA", "state" => "New York", "state_code" => "NY", "country" => "United States", "country_code" => "US" }]],
              ["Turku, Finland", [{ "latitude" => 60.4518126, "longitude" => 22.2666303, "address" => "Turku, Finland", "state" => nil, "state_code" => nil, "country" => "Finland", "country_code" => "FI" }]]]

  def self.start
    MockData.each { |area| Geocoder::Lookup::Test.add_stub(area.first, area.last) }
  end
end

=begin
# Below is the code to generate above written stub data

def generate_stubs
  areas = [
      ['sankhamul, kathmandu'],
      ['mitra road, chakupat, lalitpur'],
      ['patan dhoka, lalitpur'],
      ['labim mall, pulchok, lalitpur'],
      ['Sundhara, lalitpur'],
      ['Sundhara, kathmandu'],
      ['New Bus park, kathmandu'],
      ['Thankot, kathmandu'],
      ['Sanga, Bhaktapur'],
      ['Milan chok, Butwal, Rupandehi, Nepal'],
      ['Buddha chok, Bhairahawa, Rupandehi, Nepal'],
      ['Khaireni, Rupandehi, Nepal'],
      ['Sunawal, Nwalparasi, Nepal'],
      ['New york, NY, USA'],
      ['Turku, Finland']
  ]

  areas.map do |area|
    address = area.first
    result  = Geocoder.search(address).first
    [
        result.address, [{
        'latitude'     => result.latitude,
        'longitude'    => result.longitude,
        'address'      => result.address,
        'state'        => result.state,
        'state_code'   => result.state_code,
        'country'      => result.country,
        'country_code' => result.country_code
    }]
    ]
  end
end
=end