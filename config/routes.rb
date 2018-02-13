Rails.application.routes.draw do
  root 'users#show'
  devise_for :users
  resources :users
  get '/profile' => 'users#show', :as => :profile
  put '/profile' => 'users#update_photo'

  get '/success' => 'events#success'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
  
  resources :pets

  get '/purchase' => 'users#purchase'
  patch '/update_tokens' => 'users#update_tokens'

  resources :events do
    resources :reviews, shallow: true
    resources :requests, shallow: true
    put :book, on: :member
    get :success, on: :member
    get :confirmation, on: :member
    resources :requests do
      get :request_confirmation, on: :member
      patch :confirmed_confirmation, on: :member
      patch :denied_confirmation, on: :member
    end
  end
end
