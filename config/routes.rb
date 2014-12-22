Rails.application.routes.draw do

  get 'static_pages/home'

  root 'static_pages#home'

  get 'signup' => 'static_pages#signup'
  get 'login' => 'static_pages#login'

  devise_for :users

  resources :artists do
    resources :artworks
  end

end
