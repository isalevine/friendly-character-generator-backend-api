Rails.application.routes.draw do
  resources :search_preferences
  resources :base_characters
  resources :archetypes
  resources :search_lists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
