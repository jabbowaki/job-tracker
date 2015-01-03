Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :opportunities do
    resources :actions
    resources :ctos
  end
  resources :connections do
    resources :advocates
  end


  root 'welcome#index'

end
