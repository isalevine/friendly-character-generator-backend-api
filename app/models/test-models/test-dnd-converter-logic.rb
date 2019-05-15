
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

            # OPTIONS FOR :spend_method INCLUDE: nil, "automatic", "subtract", "bonus"
            # ("automatic" is prioritized first, and "bonus" is prioritized last -- neither spend points from points_num, unlike "subtract")
            #
            # commented-out logic has NOT been tested yet... 
            #
            # consider refactoring with SKILLS logic below, when/if modularized...
            #
            # determine order that point allocations will go in
            if stats[:chosen_by] == "both"
                if !stats[:points_class_race][:spend_points][:spend_method] || stats[:points_class_race][:spend_points][:spend_method] == "bonus"
                    stat_choice_order = ["player", "class_race"]
                # elsif stats[:points_class_race][:spend_points][:spend_method] == "automatic" || stats[:points_class_race][:spend_points][:spend_method] == "subtract"
                #     stat_choice_order = ["class_race", "player"]
                end  
            # elsif stats[:chosen_by] == "player"
            #     stat_choice_order = ["player"]
            # elsif stats[:class_race] == "class_race"
            #     stat_choice_order = ["class_race"]
            end
            
            if stats[:points_num]
                points = stats[:points_num]
                # check for choice_order + what spends the points (player/class/race)

                # modularize logic in elsif block, and implement points-subtracting/bonus logic (Exalted)
            else
                stat_choice_order.each do |chooser|
                    if chooser == "player"
                        if stats[:points_player][:preset][:preset_nums]
                            index = 0
                            archetype[:stat_priorities][:chosen_by_player].each do |stat|
                                output_character[:stats][:list][stat.to_sym] = stats[:minimum_score] + stats[:points_player][:preset][:stat_priority][index]
                                index += 1
                            end
                        end
                    end
                    if chooser == "class_race"
                        # ask ix about efficiency re: using race/class 
                        # names as key-strings, and calling .keys => then do a 
                        # .keys.include()...is that 2 full iterations??
                        conversions[:chosen_by_class_race].each_value do |class_race_array|
                            class_race_array.each do |class_race_hash|
                                if !class_race_hash[:name]
                                    break
                                elsif class_race_hash[:name] == output_character[:class] || class_race_hash[:name] == output_character[:race]
                                    class_race_hash[:list].each do |bonus_hash|
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
            skills = game_system[:system_skills]
            conversions = game_system[:skill_conversions]
            skill_choice_order = []
            points = nil

            #determine order that point allocations will go in
            if skills[:chosen_by] == "both"
                # if !skills[:points_class_race][:spend_method] || skills[:points_class_race][:spend_method] == "bonus"
                #     skill_choice_order = ["player", "class_race"]
                elsif skills[:points_class_race][:spend_method] == "automatic" || skills[:points_class_race][:spend_method] == "subtract"
                    skill_coice_order = ["class_race", "player"]
                end
            # elsif stats[:chosen_by] == "player"
            #     stat_choice_order = ["player"]
            # elsif stats[:chosen_by] == "class_race"
            #     stat_choice_order = ["class_race"]
            end

            if skills[:points_num]
                points = skills[:points_num]

                skill_choice_order.each do |chooser|
                    chooser_key = ("points_" + chooser).to_sym
                    # check chooser_key
                    byebug
                    subtraction = false
                    if skills[chooser_key][:spend_points][:spend_method] == "automatic" || skills[chooser_key][:spend_points][:spend_method] == "bonus"
                        # no change
                    elsif skills[chooser_key][:spend_points][:spend_method] == "subtract"
                        subtraction = true
                    end

                    if chooser == "player"
                        # build out chosen_by_player in skill_conversions ASAP!!!
                    elsif chooser == "class_race"
                        conversions[:chosen_by_class_race].each do |class_race_array|
                            class_race_array.each do |class_race_hash|
                                if !class_race_hash[:name]
                                    break
                                elsif class_race_hash[:name] == output_character[:class] || class_race_hash[:name] == output_character[:race]
                                    index = 0
                                    while index < class_race_hash[:num_chosen]
                                        priority_skill = archetype[:skill_priorities][:chosen_by_player][index]
                                        class_race_hash[:list].each do |skill|
                                            if skill[:skill] == priority_skill
                                                skill_hash = {
                                                    name: priority_skill,
                                                    points: skills[:minimum_score] + skill[:bonus]
                                                }
                                                output_character[:skills][:list] << skill_hash
                                                break
                                            end
                                        end
                                        index += 1
                                    end
                                end
                            end
                        end
                    end

                end
            end

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