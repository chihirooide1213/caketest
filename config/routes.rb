Rails.application.routes.draw do

 root to: 'homes#top'
 get'/homes/about', to: 'homes#about'

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :clients, controllers: {
  sessions:      'clients/sessions',
  passwords:     'clients/passwords',
  registrations: 'clients/registrations'
}

namespace :admins do
	resources :clients
	resources :genres
	resources :products
	resources :orders do
		resources :order_products
	end
end

namespace :clients do
	resources :products
	resources :orders
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
