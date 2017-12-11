Rails.application.routes.draw do
  devise_for :admins
  get 'users/index'

  get 'users/show'

  get '/users/list'

  devise_for :users
  resources :users
  resources :users do
    member {post :vote}
  end
  root 'static#index'
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  resources :users do
    post 'search',  :on => :collection
  end

  mount Commontator::Engine => '/commontator'
end
