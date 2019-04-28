Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      resources :base_characters do
        resources :search_preferences
      end

      resources :archetypes do
        resources :search_lists
      end

    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
