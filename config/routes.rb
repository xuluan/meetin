Meetin::Application.routes.draw do

  resources :choices, :only => [:create, :destroy]

  resources :roles, :only => [:update] 

  resources :meetings, :except => [:update] 
    
  resources :members, :only => [:create, :destroy]

  devise_for :users

  root :to => "meetings#index"

end
