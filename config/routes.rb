Rails.application.routes.draw do
  resources :users, except: [:index, :new, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :opportunities do
    resources :advocates, except: [:index, :show]
    resources :actions, except: [:index, :show]
    resources :ctos, except: [:index, :show]
  end


  root 'welcome#index'

end
