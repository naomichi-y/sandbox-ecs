class ApplicationController < ActionController::Base
  include DockerFluentLogger::Payload

  protect_from_forgery with: :exception
  rescue_from Exception, with: :render_500 unless Rails.env.production?

  def render_404(e = nil)
    @title = '404 Page Not Found'
    render template: 'errors/error', status: 404, layout: 'application'
  end

  def render_500(e = nil)
    logger.fatal(e.to_s + ' ' + e.backtrace.to_s)

    @title = '500 Internal server error'
    render template: 'errors/error', status: 500, layout: 'application'
  end
end
