Rails.application.routes.draw do
  root                'static_pages#home'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
  resources :cards,                only: [:new, :create]
  resources :decks
  resources :saved_external_decks, only: [:create, :destroy]
  resource  :collection,           only: [:show]
end
