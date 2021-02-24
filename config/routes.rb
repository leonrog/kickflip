Rails.application.routes.draw do
  get 'bookings/index'
  get 'bookings/show'
  get 'obstacles/index'
  get 'obstacles/new'
  get 'obstacles/update'
  get 'obstacles/create'
  get 'obstacles/show'
  get 'obstacles/edit'
  get 'obstacles/delete'
  devise_for :users
  get '/myprofile', to: 'users#show', as: :my_profile
  get '/myprofile/edit', to: 'users#edit', as: :edit_my_profile
  put '/myprofile', to: 'users#update', as: :update_my_profile
  root to: 'pages#home'
  resources :obstacles do
    resources :bookings, only:[:index, :new, :create, :delete, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
