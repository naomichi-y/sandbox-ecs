Rails.application.configure do
  config.lograge.logger = ActiveSupport::Logger.new(STDOUT)
  config.lograge.enabled = true
  config.lograge.keep_original_rails_log = false
  config.lograge.formatter = Lograge::Formatters::Logstash.new

  config.lograge.custom_options = lambda do |event|
    {
      host: event.payload[:host],
      remote_ip: event.payload[:remote_ip],
      original_fullpath: event.payload[:original_fullpath],
      useragent: event.payload[:useragent],
      time: event.time
    }
  end
end
