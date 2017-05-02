Rails.application.configure do
  config.lograge.logger = ActiveSupport::Logger.new(STDOUT)
  config.lograge.enabled = true
  config.lograge.keep_original_rails_log = false
  config.lograge.formatter = Lograge::Formatters::Logstash.new

  config.lograge.custom_options = lambda do |event|
    data = {
      uuid: event.payload[:uuid],
      host: event.payload[:host],
      original_fullpath: event.payload[:original_fullpath],
      remote_ip: event.payload[:remote_ip],
      referer: event.payload[:referer],
      user_agent: event.payload[:user_agent]
    }

    if event.payload[:exception]
      e = event.payload[:exception_object]
      data[:exception_class] = e.class.to_s
      data[:exception_message] = e.message
      data[:backtrace] = e.backtrace
    end

    data
  end
end
