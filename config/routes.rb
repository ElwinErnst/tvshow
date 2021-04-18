Rails.application.routes.draw do
  resources :episodes
  resources :seasons
  resources :films
  resources :generes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "films#index"
end
