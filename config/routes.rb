Rails.application.routes.draw do
  root 'home#index'
  post '/', to: 'home#show'
  get '/indice_crypto', to: "home#index"

   post '/indice_crypto', to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
