class HomeController < ApplicationController
  def index; end

  def raise_error
    raise 'Invoke raise error'
  end

  def logger_error
    logger.error "AAA\nBBB"
    head 200
  end
end
