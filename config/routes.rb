Rails.application.routes.draw do
  root 'pages#home'
  
  get 'hakkimizda', to: 'pages#about', as: :about
  get 'urunler', to: 'pages#products', as: :products
  get 'servis', to: 'pages#service', as: :service
  get 'yedek-parca', to: 'pages#spare_parts', as: :spare_parts
  get 'iletisim', to: 'pages#contact', as: :contact
  
  resources :contacts, only: [:create]
  
  namespace :admin do
    get '/', to: 'contacts#index'
    resources :contacts, only: [:index, :show, :update, :destroy]
  end
end
