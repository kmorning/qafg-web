Rails.application.routes.draw do
  get 'meetings/index'
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :meetings, only: [:index]
end
