Rails.application.routes.draw do

  # UNCOMMENT do/end nesting below to enable has_many/belongs_to relationships
  # (also, don't forget to look into Serializer!)


  # CURRENTLY: uncommenting namespace:api and :v1, debugging search_list fetches

  # namespace :api do
  #   namespace :v1 do


      # ARE BASE_CHARACTERS USED ANYMORE?? CONSIDER REMOVING...
      resources :base_characters # do
        resources :search_preferences, only: [:show, :create, :update, :destroy]
      # end

      resources :archetypes # do
        resources :search_lists
      # end

      resources :game_systems

      
      resources :snippets
      resources :snippet_tags
      resources :tags


      post '/converter/generate_output_character', to: 'converter#generate_output_character'
      post '/converter/archetype_system_converter', to: 'converter#archetype_system_converter'

      resources :users, only: [:create]
      post '/login', to: 'auth#create'


    # end
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
