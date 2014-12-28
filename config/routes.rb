Rails.application.routes.draw do
  resources :users
  resources :opportunities do
    resources :ctos
  end
  resources :connections do
    resources :actions do
      resources :advocates
    end
  end


  root 'welcome#index'

end
