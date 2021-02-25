Rails.application.routes.draw do
  devise_for :users
  get '/myprofile', to: 'users#show', as: :my_profile
  get '/myprofile/edit', to: 'users#edit', as: :edit_my_profile
  get '/mydashboard', to: 'obstacles#dashboard', as: :my_dashboard
  put '/myprofile', to: 'users#update', as: :update_my_profile
  root to: 'pages#home'
  resources :obstacles do
    resources :bookings, only:[:index, :new, :create, :show]
  end
  resources :bookings, only: :destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
