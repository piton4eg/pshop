Shop::Application.routes.draw do
  resources :line_items

  resources :carts

  get "store/index"
  resources :products

  match '/help', to: 'static_pages#help', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'

  root to: 'store#index'

end
