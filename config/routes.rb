Rails.application.routes.draw do
  root to: 'home#index'
  get 'raise_error', to: 'home#raise_error'
  get 'logger_warn', to: 'home#logger_warn'
  get 'logger_error', to: 'home#logger_error'
  get 'logger_fatal', to: 'home#logger_fatal'

  match '/', controller: 'application', action: 'render_404', via: :all
  match '*path', controller: 'application', action: 'render_404', via: :all
end
