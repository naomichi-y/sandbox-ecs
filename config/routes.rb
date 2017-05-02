Rails.application.routes.draw do
  root to: 'home#index'
  get 'raise_error', to: 'home#raise_error'
  get 'fatal_error', to: 'home#fatal_error'
  get 'logger_error', to: 'home#logger_error'

  match '*path', controller: 'application', action: 'render_404', via: :all
end
