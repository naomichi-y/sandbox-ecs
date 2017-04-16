Rails.application.routes.draw do
  root to: 'home#index'
  get 'raise_error', to: 'home#raise_error'
  get 'logger_error', to: 'home#logger_error'

  get '*path', controller: 'application', action: 'render_404'
end
