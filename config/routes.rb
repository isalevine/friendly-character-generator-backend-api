Rails.application.routes.draw do

  # UNCOMMENT do/end nesting below to enable has_many/belongs_to relationships
  # (also, don't forget to look into Serializer!)

  namespace :api do
    namespace :v1 do

      resources :base_characters # do
        resources :search_preferences, only: [:show, :create, :update, :destroy]
      # end

      resources :archetypes # do
        resources :search_lists
      # end

    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
