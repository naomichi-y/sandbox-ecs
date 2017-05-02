class HomeController < ApplicationController
  def index; end

  def raise_error
    raise 'Invoke raise error'
  end

  def fatal_error
    begin
      4/0
    rescue => e
      logger.fatal(e.to_s)
      logger.fatal(e.backtrace)
    end
    head 200
  end

  def logger_error
    logger.error "AAA\nBBB"
    head 200
  end
end
