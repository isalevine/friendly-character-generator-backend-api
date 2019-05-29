require_relative '../../test-logic-files/test-dnd-game-system.rb'
# require 'byebug'


# COPIED CODE INTO applicationcontroller !!!

def generate_output_character(game_system)

    output_character = {}

    output_character[:archetype_name] = nil

    if game_system[:system_classes][:has_classes]
        classes = game_system[:system_classes]
        output_character[:class] = {
            alias: classes[:class_alias],
            text: nil
        }
    end

    if game_system[:system_races][:has_races]
        races = game_system[:system_races]
        output_character[:race] = {
            alias: classes[:race_alias],
            text: nil
        }
    end

    if game_system[:system_stats][:has_stats]
        stats = game_system[:system_stats]
        stat_list = stats[:stat_list].select { |stat| stat }
        output_character[:stats] = {
            alias: stats[:stat_alias],
            list: stat_list
        }
    end

    if game_system[:system_skills][:has_skills]
        skills = game_system[:system_skills]
        output_character[:skills] = {
            alias: skills[:skill_alias],
            list: []
        }
    end

    if game_system[:system_powers][:has_powers]
        powers = game_system[:system_powers]
        output_character[:powers] = {
            alias: powers[:power_alias],
            list: []
        }
    end

    # (!!! SPELLS NOT BUILT IN dnd_game_system SEED !!!)
    # if game_system[:system_spells][:has_spells]
    #     spells = game_system[:system_spells]
    #     output_character[:spells] = {
    #         alias: spells[:spell_alias],
    #         list: []
    #     }
    # end

    # (??? HOW TO PREVENT output_skill_preferences FROM GOING INTO output_character ???)
    # ( => possibly set values to 'nil' after running through Converter,
    #      and during rendering, skip over any unique_parameters that are nil?)
    if game_system[:system_unique].length > 0
        unique_parameters = game_system[:system_unique]
        unique_parameters.each do |parameter_string|
            # (??? WHY DOES system_unique HAVE "class" AND "race" IN SEEDS ???)
            if parameter_string != "class" && parameter_string != "race"
                parameter_key = parameter_string.to_sym
                output_character[parameter_key] = nil
            end
        end
    end

    output_character
end


generate_output_character(dnd_game_system)