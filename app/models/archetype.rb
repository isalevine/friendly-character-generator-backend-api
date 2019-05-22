class Archetype < ApplicationRecord
    after_find do |archetype|
        # grab game_system and output_character, and run archetype_system_converter??
    end
end
