Meetin::Application.routes.draw do

  resources :choices, only: [:create]

  resources :roles, only: [:update]

  resources :meetings

  resources :members, only: [:create, :destroy]

  devise_for :users

  root to: "meetings#index"

end
