Rails3MongoidDevise::Application.routes.draw do

  resources :laptops

  root :to => "home#index"
  devise_for :users
  # resources :users, :only => :show
  resources :users, :only => [:show, :index]
  # The priority is based upon order of creation:
  # first created -> highest priority.


end
