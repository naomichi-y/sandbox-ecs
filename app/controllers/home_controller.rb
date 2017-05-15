class HomeController < ApplicationController
  def index; end

  def raise_error
    raise 'Invoke raise error'
  end

  def logger_warn
    logger.error "LOGGER\nERROR"
    head 200
  end

  def logger_error
    logger.error "LOGGER\nWARN"
    head 200
  end

  def logger_fatal
    logger.error "LOGGER\nERROR"
    head 200
  end
end
