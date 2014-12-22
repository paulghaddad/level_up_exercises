Rails.application.routes.draw do

  root 'static_pages#home'

  get 'signup' => 'users#new'
  get 'signin' => 'sessions#new'

  resources :artists do
    resources :artworks
  end

  resources :users

  resource :session
end
