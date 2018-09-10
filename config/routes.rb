Rails.application.routes.draw do
  resources :users
  resources :products
  resources :cartegories
  get 'store/index'

  root to: 'store#index'
  get 'admin' => 'admin#index'
  get 'register' => 'users#new'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
