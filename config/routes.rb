Shop::Application.routes.draw do
  get 'admin' => "admin#index"

  controller :sessions do
    get     'login' => :new
    post    'login' => :create
    delete  'logout' => :destroy
  end

  resources :users
  resources :orders
  resources :line_items
  resources :carts

  get "store/index"
  resources :products do
    get :who_bought, on: :member
  end

  match '/help', to: 'static_pages#help', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'

  root to: 'store#index'

end
