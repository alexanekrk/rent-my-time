Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get '/search', to: "pages#search"

  get 'pigeons/my_pigeons', to: 'pigeons#my_pigeons', as: :my_pigeons
  resources :pigeons do
    resources :bookings, only: [ :new, :create, :edit, :update ]
  end
  resources :bookings, only: [ :index, :show, :delete]
end
