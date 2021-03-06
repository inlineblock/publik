Rails.application.routes.draw do
  resources :coffee_products
  resources :coffee_types, { only: [:index, :show, :update, :create, :destroy], defaults: { format: :json } }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
