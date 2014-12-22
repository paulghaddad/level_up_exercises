Rails.application.routes.draw do

  get 'static_pages/home'

  root 'static_pages#home'

  get 'login' => 'static_pages#login'

  devise_scope :user do
    get "signup" => "devise/registrations#new"
  end

  devise_for :users, controllers: {
    sessions: 'devise/sessions'
  }

  resources :users, only: [:index, :show]

  resources :artists do
    resources :artworks
  end

end
