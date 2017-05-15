class ApplicationController < ActionController::Base
  include DockerFluentLogger::Payload

  protect_from_forgery with: :exception
  rescue_from Exception, with: :render_500 if Rails.env.production?

  def render_404(e = nil)
    @title = '404 Page Not Found'
    render template: 'errors/error', status: 404, layout: 'application'
  end

  def render_500(e = nil)
    @title = '500 Internal server error'
    append_payload_error(e) if e

    respond_to do |format|
      format.html { render template: 'errors/error', status: 500, layout: 'application' }
      format.all { render body: '', head: 500 }
    end
  end
end
