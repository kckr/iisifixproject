# For more info see https://cbabhusal.wordpress.com/2016/12/31/soap-with-ruby/
# Each query could cost $0.3, so in development environment the free REG-NUM is hit
#  for testing purposes
#
#  reg = RegistrationApi.new('MYREG2334')
#  response = reg.response
#  make = response.make
#
##
class RegistrationApi
  attr_accessor :client, :response

  def initialize(reg_number)
    @reg_number = reg_number#Rails.env.production? ? reg_number : Config::DummyRegistrationNumber
    @client     = Savon::client do |globals|
      globals.wsdl 'http://www.regcheck.org.uk/api/reg.asmx?wsdl'
      globals.convert_request_keys_to :none # or one of [:lower_camelcase, :upcase, :none]
    end
    @response   = query
  end

  private

  def query
    if (data = DataStore.find_by_registration_number(@reg_number))
      data
    else
      raw_response = @client.call(:check_finland,
                                  message: {
                                      :username            => ENV['rekisterinumeroapi_username'],
                                      'RegistrationNumber' => @reg_number })
      DataStore.create extract_data(raw_response)
    end
  end


  def extract_data(raw_response)
    response = JSON.load raw_response.body[:check_finland_response][:check_finland_result][:vehicle_json]
    { :registration_number => @reg_number,
      :description         => response['Description'],
      :registration_year   => response['RegistrationYear'],
      :make                => response['CarMake']['CurrentTextValue'],
      :make_description    => response['MakeDescription']['CurrentTextValue'],
      :model               => response['CarModel']['CurrentTextValue'],
      :model_description   => response['ModelDescription']['CurrentTextValue'],
      :vin                 => response['VechileIdentificationNumber'], # Vehicle Indentification Number
      :insurer             => response['InsuranceCompany'],
      :tow_bar             => response['TowBar']
    }
  end

end
