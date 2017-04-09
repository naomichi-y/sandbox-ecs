class HomeController < ApplicationController
  def index; end

  def raise_error
    raise 'Invoke raise error'
  end

  def logger_error
    logger = DockerLogger.new(STDOUT)
    logger.group = 'test'
    logger.error 'Invoke logger error'
    head 200
  end
end
