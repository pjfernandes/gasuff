Rails.application.routes.draw do
  devise_for :users
  root to: 'samples#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :samples
  resources :researchers
  resources :gases
  resources :waters
  resources :sediments

  get 'export', to: 'samples#export'

  resources :researchers do
    resources :samples
  end
end
