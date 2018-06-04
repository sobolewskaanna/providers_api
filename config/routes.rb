Rails.application.routes.draw do
  resources :providers, only: [:index], defaults: { format: :json }
end
