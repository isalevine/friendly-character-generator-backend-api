
# IS IT NECESSARY TO REQUIRE_ALL / INPORT THE HASHES TO PASS IN???
require './test-archetype-big-sword-knight'
require './test-dnd-game-system'
require './test-dnd-output-character'
require 'byebug'


archetype = $archetype_big_sword_knight
game_system = $dnd_game_system
output_character = $blank_dnd_output_character

class Converter
    def self.archetype_system_converter(archetype, game_system, output_character)
        system_key = game_system[:unique_name].to_sym

        # set output-character's archetype_name to archetype's name


        # check class
        if game_system[:system_classes][:has_classes]
            output_character[:class] = archetype[:system_unique][system_key][:class]
        end


        # check race
        if game_system[:system_races][:has_races]
            output_character[:race] = archetype[:system_unique][system_key][:race]
        end


        # check stats
        if game_system[:system_stats][:has_stats]
            stats = game_system[:system_stats]
            conversions = game_system[:stat_conversions]
            stat_choice_order = []
            points = nil

            # determine order that point allocations will go in
            if stats[:chosen_by] == "both"
                if stats[:points_class_race][:spend_method] == "bonus" || !stats[:points_class_race][:spend_points]
                    stat_choice_order = ["player", "class_race"]
                elsif stats[:points_class_race][:spend_method] == "subtract"
                    stat_choice_order = ["class_race", "player"]
                end  
            elsif stats[:chosen_by] == "player"
                stat_choice_order = ["player"]
            elsif stats[:class_race] == "class_race"
                stat_choice_order = ["class_race"]
            end
            
            if stats[:points_num]
                points = stats[:points_num]
                # modularize logic in elsif block, and implement points-subtracting/bonus logic (Exalted)
            else
                stat_choice_order.each do |chooser|
                    if chooser == "player"
                        if stats[:points_player][:preset][:preset_nums]
                            index = 0
                            archetype[:stat_weights][:chosen_by_player].each do |stat|
                                output_character[:stats][:list][stat.to_sym] = stats[:minimum_score] + stats[:points_player][:preset][:stat_priority][index]
                                index += 1
                            end
                        end
                    end
                    if chooser == "class_race"
                        # ask ix about efficiency re: using race/class 
                        # names as key-strings, and calling .keys => then do a 
                        # .keys.include()...is that 2 full iterations??
                        conversions[:chosen_by_class_race].each_value do |array|
                            array.each do |hash|
                                if !hash[:name]
                                    break
                                elsif hash[:name] == output_character[:class] || hash[:name] == output_character[:race]
                                    hash[:list].each do |bonus_hash|
                                        if !bonus_hash[:stat]
                                            break
                                        else
                                            stat_key = bonus_hash[:stat].to_sym
                                            output_character[:stats][:list][stat_key] += bonus_hash[:bonus]
                                        end
                                    end
                                    break
                                end
                            end
                        end            
                    end
                end
            end

            # 
            #
        end

        # check skills
        if game_system[:system_skills][:has_skills]

        end


        # check powers
        if game_system[:system_powers][:has_powers]

        end


        # check system_unique
        if game_system[:system_unique][0]

        end


        byebug

    end

end


Converter.archetype_system_converter(archetype, game_system, output_character)