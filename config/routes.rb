Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get '/search', to: "pages#search"

  get 'pigeons/my_pigeons', to: 'pigeons#my_pigeons', as: :my_pigeons

  get "bookings/booking_rent_from", to: 'bookings#rent_from', as: :rent_from
  get "bookings/booking_rent_to", to: 'bookings#rent_to', as: :rent_to

  resources :pigeons do
    resources :bookings, only: [ :new, :create, :edit, :update ]
  end

  resources :bookings, only: [ :index, :show, :destroy]
end
