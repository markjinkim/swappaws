Rails.application.routes.draw do
  root 'tests#index' 
  devise_for :users
  resources :tests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end