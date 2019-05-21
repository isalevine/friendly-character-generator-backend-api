class GameSystem < ApplicationRecord
    after_initialize do |game_system|
        generate_output_character(game_system)
   end
end
