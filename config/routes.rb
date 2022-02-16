Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace:v1 do
      get '/merchants/find', to: 'searches#find'
      get '/items/find_all', to: 'searches#find_all'
      resources :merchants, only: [:index, :show] do
        get :most_items, on: :collection, controller: :merchants
        resources :items, only: [:index], controller: :merchant_items
      end
      resources :items do
        resources :merchant, only: [:index], controller: :item_merchant
      end
      namespace :revenue do
        resources :merchants, only: [:index, :show]
      end
    end
  end
end
