Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :create, :show, :update, :destroy]
  resources :artworks, only: [:index, :create, :show, :update, :destroy]

  # Same as: ...
  # get 'users', to: 'users#index', as:'user'
  # post 'users/:id', to: 'users#create'
  # get 'users/new', to: 'users#new', as:'new_user'
  # get 'users/:id/edit', to: 'users#edit', as:'edit_user'
  # get 'users/:id', to: 'users#show'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#delete'
end
