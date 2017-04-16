class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def render_404(exception = nil)
    STDERR.puts "error_404: #{exception.message}" if exception
    @title = '404 Page Not Found'
    render template: 'errors/error', status: 404, layout: 'application'
  end
end
