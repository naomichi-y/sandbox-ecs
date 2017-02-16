class HomeController < ApplicationController
  def index
  end

  def error
    logger.fatal('test')
    #raise RuntimeError.new('test')
  end
end
