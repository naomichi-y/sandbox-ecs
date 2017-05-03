class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def append_info_to_payload(payload)
    super

    payload[:uuid] = request.uuid
    payload[:url] = request.url
    payload[:referer]  = request.referer
    payload[:remote_ip] = request.remote_ip
    payload[:user_agent] = request.user_agent
  end

  def render_404(exception = nil)
    @title = '404 Page Not Found'
    render template: 'errors/error', status: 404, layout: 'application'
  end
end
