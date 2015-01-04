Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :opportunities do
    resources :advocates
    resources :actions
    resources :ctos
  end


  root 'welcome#index'

end
