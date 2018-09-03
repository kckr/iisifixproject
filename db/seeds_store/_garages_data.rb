puts ("#{'-' * 80}").green
puts "Preparing Garages to load ...".blue
garage_owner = User.create type: 'GarageOwner', email: 'garageowner1@easyfix.com'
GaragePayload = [{
                     name:         'Banglamukhi vehicle services',
                     address:      'Sankhamul Bridge, Patan 44600, Nepal',
                     city:         'Lalitpur',
                     zip:          '1233',
                     opening_time: '9:00 AM',
                     closing_time: '5:00 PM',
                     phone_number: '31231233',
                     fax_number:   '123123123',
                     email:        'garageowner1@iisifix.com',
                     about:        Faker::Lorem.paragraph,
                     user_id:      garage_owner.id
                 }, {
                     name:         'Maharjan Motor services',
                     address:      'Chakupat Rd, Patan 44600, Nepal',
                     city:         'Kathmandu',
                     zip:          '1233',
                     opening_time: '5:00 AM',
                     closing_time: '5:00 PM',
                     phone_number: '31231233',
                     fax_number:   '123123123',
                     email:        'garageowner2@iisifix.com',
                     about:        Faker::Lorem.paragraph,
                     user_id:      garage_owner.id,
                 }, {
                     name:         'Lalit vehicle services',
                     address:      'Patan Dhoka, Patan 44600, Nepal',
                     city:         'Lalitpur',
                     zip:          '1233',
                     opening_time: '11:00 AM',
                     closing_time: '5:00 PM',
                     phone_number: '31231233',
                     fax_number:   '123123123',
                     email:        'garageowner3@iisifix.com',
                     about:        Faker::Lorem.paragraph,
                     user_id:      garage_owner.id
                 }, {
                     name:         'Jyaasa ko vehicle services',
                     address:      'Patan Sundhara, Patan, Nepal',
                     city:         'Lalitpur',
                     zip:          '1233',
                     opening_time: '5:00 AM',
                     closing_time: '5:00 PM',
                     phone_number: '31231233',
                     fax_number:   '123123123',
                     email:        'garageowner4@iisifix.com',
                     about:        Faker::Lorem.paragraph,
                     user_id:      garage_owner.id
                 }, {
                     name:         'Bhimsen vehicle workshop',
                     address:      'Sundhara, Kathmandu 44600, Nepal',
                     city:         'Lalitpur',
                     zip:          '1233',
                     opening_time: '5:00 AM',
                     closing_time: '5:00 PM',
                     phone_number: '31231233',
                     fax_number:   '123123123',
                     email:        'garageowner5@iisifix.com',
                     about:        Faker::Lorem.paragraph,
                     user_id:      garage_owner.id
                 }, {
                     name:         'Sandeep dai ko workshop',
                     address:      'New Rd, Kathmandu 44600, Nepal',
                     city:         'Kathmandu',
                     zip:          '1233',
                     opening_time: '5:00 AM',
                     closing_time: '5:00 PM',
                     phone_number: '31231233',
                     fax_number:   '123123123',
                     email:        'garageowner6@iisifix.com',
                     about:        Faker::Lorem.paragraph,
                     user_id:      garage_owner.id
                 }, {
                     name:         'Saurav dai ko workshop',
                     address:      'Thankot, Chandragiri 44619, Nepal',
                     city:         'Kathmandu',
                     zip:          '1233',
                     opening_time: '5:00 AM',
                     closing_time: '5:00 PM',
                     phone_number: '31231233',
                     fax_number:   '123123123',
                     email:        'garageowner7@iisifix.com',
                     about:        Faker::Lorem.paragraph,
                     user_id:      garage_owner.id
                 }, {
                     name:         'Kuber dai ko workshop',
                     address:      'Bhaktapur Nala Rd, Nepal',
                     city:         'Bhaktapur',
                     zip:          '1233',
                     opening_time: '5:00 AM',
                     closing_time: '5:00 PM',
                     phone_number: '31231233',
                     fax_number:   '123123123',
                     email:        'garageowner8@iisifix.com',
                     about:        Faker::Lorem.paragraph,
                     user_id:      garage_owner.id
                 }, {
                     name:         'Niraj dai ko workshop',
                     address:      'Milan Chowk, Butwal 32907, Nepal',
                     city:         'Butwal',
                     zip:          '1233',
                     opening_time: '5:00 AM',
                     closing_time: '5:00 PM',
                     phone_number: '31231233',
                     fax_number:   '123123123',
                     email:        'garageowner9@iisifix.com',
                     about:        Faker::Lorem.paragraph,
                     user_id:      garage_owner.id
                 }, {
                     name:         'AAkash dai ko Garage',
                     address:      'Siddharthanagar, Nepal',
                     city:         'Bhairahwa',
                     zip:          '1233',
                     opening_time: '5:00 AM',
                     closing_time: '5:00 PM',
                     phone_number: '31231233',
                     fax_number:   '123123123',
                     email:        'garageowner10@iisifix.com',
                     about:        Faker::Lorem.paragraph,
                     user_id:      garage_owner.id
                 }, {
                     name:         'Kamal Bhattarai engineering works',
                     address:      'Khaireni, Devdaha Municipality 32900, Nepal',
                     city:         'Khaireni',
                     zip:          '1233',
                     opening_time: '5:00 AM',
                     closing_time: '5:00 PM',
                     phone_number: '31231233',
                     fax_number:   '123123123',
                     email:        'garageowner11@iisifix.com',
                     about:        Faker::Lorem.paragraph,
                     user_id:      garage_owner.id
                 }, {
                     name:         'Surya dai ko engineering workshop',
                     address:      'Sunwal, Nepal',
                     city:         'Sunwal',
                     zip:          '1233',
                     opening_time: '5:00 AM',
                     closing_time: '5:00 PM',
                     phone_number: '31231233',
                     fax_number:   '123123123',
                     email:        'garageowner12@iisifix.com',
                     about:        Faker::Lorem.paragraph,
                     user_id:      garage_owner.id
                 }, {
                     name:         'New York ka hari dai ko engineering workshop',
                     address:      'New York, NY, USA',
                     city:         'New York',
                     zip:          '1233',
                     opening_time: '5:00 AM',
                     closing_time: '5:00 PM',
                     phone_number: '31231233',
                     fax_number:   '123123123',
                     email:        'garageowner13@iisifix.com',
                     about:        Faker::Lorem.paragraph,
                     user_id:      garage_owner.id
                 }, {
                     name:         'Roshan dai ko engineering workshop',
                     address:      'Turku, Finland',
                     city:         'Turku',
                     zip:          '1233',
                     opening_time: '5:00 AM',
                     closing_time: '5:00 PM',
                     phone_number: '31231233',
                     fax_number:   '123123123',
                     email:        'garageowner14@iisifix.com',
                     about:        Faker::Lorem.paragraph,
                     user_id:      garage_owner.id
                 }, {
                     name:         'Thaman dai ko engineering workshop',
                     address:      'Helsinki, Finland',
                     city:         'Helsinki',
                     zip:          '1233',
                     opening_time: '5:00 AM',
                     closing_time: '5:00 PM',
                     phone_number: '31231233',
                     fax_number:   '123123123',
                     email:        'garageowner15@iisifix.com',
                     about:        Faker::Lorem.paragraph,
                     user_id:      garage_owner.id
                 }]

def load_garages_data
  Garage.create GaragePayload
  IisifixLogger.log 'Garage Data loaded !!!'
end
