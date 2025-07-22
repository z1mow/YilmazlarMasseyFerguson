Rails.application.routes.draw do
  get "agricultural_equipment/index"
  get "agricultural_equipment/matris"
  get "agricultural_equipment/alpler"
  root 'pages#home'
  
  get 'hakkimizda', to: 'pages#about', as: :about
  get 'urunler', to: 'pages#products', as: :products
  get 'servis', to: 'pages#service', as: :service
  get 'yedek-parca', to: 'pages#spare_parts', as: :spare_parts
  get 'iletisim', to: 'pages#contact', as: :contact
  get 'musteri_aydinlatma', to: 'pages#musteri_aydinlatma'
  get 'tedarikci_aydinlatma', to: 'pages#tedarikci_aydinlatma'
  
  # KVKK Sayfaları
  get 'kvkk-politikasi', to: 'pages#kvkk_policy', as: :kvkk_policy
  get 'kvkk-aydinlatma-metni', to: 'pages#kvkk_disclosure', as: :kvkk_disclosure
  
  # Agricultural Equipment Routes
  get 'tarim-makinalari', to: 'agricultural_equipment#index'
  get 'tarim-makinalari/matris', to: 'agricultural_equipment#matris'
  get 'tarim-makinalari/alpler', to: 'agricultural_equipment#alpler'
  get 'tarim-makinalari/montano', to: 'agricultural_equipment#montano'
  get 'tarim-makinalari/parlayan', to: 'agricultural_equipment#parlayan'
end
