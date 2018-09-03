module IisifixLogger
  def log(message, message_color: :green)
    puts '~'.yellow.bold * 100
    puts "DateTime: #{DateTime.now}"
    puts '~'.yellow.bold * 100
    puts message.try(message_color)
    puts '~'.yellow.bold * 100
  end

  module_function :log
end
