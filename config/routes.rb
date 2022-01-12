Rails.application.routes.draw do
  devise_for :users
  root to: 'samples#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :samples
  resources :researchers
  resources :carbons
  resources :methanes
  resources :sediments

  resources :researchers do
    resources :samples
  end
end
