Rails.application.routes.draw do
  root to: 'home#index'
  get 'raise_error', to: 'home#raise_error'
  get 'logger_error', to: 'home#logger_error'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
