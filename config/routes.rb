Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :books, only: [:index, :show, :new, :create]
  resources :borrowings, only: [:create, :update]

  get 'profile', to: 'users#profile'

  root 'books#index'
end
