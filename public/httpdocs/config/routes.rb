Rails.application.routes.draw do
  # Admin authentication routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'pages#home'
  
  get 'hakkimizda', to: 'pages#about', as: :about
  get 'urunler', to: 'pages#products', as: :products
  get 'servis', to: 'pages#service', as: :service
  get 'yedek-parca', to: 'pages#spare_parts', as: :spare_parts
  get 'iletisim', to: 'pages#contact', as: :contact
  
  resources :contacts, only: [:create]
  
  namespace :admin do
    root 'contacts#index'
    resources :contacts, only: [:index, :show, :update, :destroy]
  end
end
