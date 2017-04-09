class HomeController < ApplicationController
  def index
    # l = DockerLogger.new(STDOUT, 0, level: :info)
    # l.log_group = 'test'
    # l << "write\nmessage"
    # l.info("WRITE")
    #l.info(Logger::VERSION)
    #l.add(Logger::Severity::DEBUG, 'aaa')
  end

  def raise_error
    raise 'Invoke raise error'
  end

  def logger_error
    logger.error 'Invoke logger error'
    head 200
  end
end
