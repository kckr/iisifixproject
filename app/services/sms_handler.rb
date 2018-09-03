class SmsHandler
  attr_reader :from, :client
  cattr_accessor :sent_smses
  @@sent_smses = []

  def initialize(from: nil)
    @from   ||= Config::SmsFrom
    @client = Nexmo::Client.new(key: ENV['NexmoAPIKey'], secret: ENV['NexmoAPISecret'])
  end

  def send(to:, message:)
    sms_data = { from: from, to: to, text: message }
    send_sms(sms_data)
    @@sent_smses << sms_data
    IisifixLogger.log("SMS successfully sent to '#{to}', Message: '#{message}', \nEnv: #{Rails.env}")
  end

  class << self
    def flush_log
      @@sent_smses = []
    end
  end

  private

  def send_sms(sms_data)
    client.send_message(sms_data) unless Rails.env.test?
  end
end
