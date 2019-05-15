
def archetype_system_converter(archetype, game_system, output_character)

    # check class
    if game_system.system_classes.has_classes
        output_character.class = archetype.system_unique["#{game_system.unique_name}"].class
    end


    # check race
    if game_system.system_races.has_races
        output_character.race = archetype.system_unique["#{game_system.unique_name}"].race
    end


    # check stats
    if game_system.system_stats.has_stats
        stats = game_system.system_stats
        conversions = game_system.stat_conversions
        stat_choice_order = []
        points = nil

        # determine order that point allocations will go in
        if stats[:chosen_by] == "both"
            if stats[:points_class_race][:spend_points] == "bonus"
                stat_choice_order = ["player", "class_race"]
            elsif stats[:points_class_race][:spend_points] == "subtract"
                stat_choice_order = ["class_race", "player"]
            end  
        elsif stats[:chosen_by] == "player"
            stat_choice_order = ["player"]
        elsif stats[:class_race] == "class_race"
            stat_choice_order = ["class_race"]
        end
        
        if stats.points_num
            points = stats.points_num
            # modularize logic in elsif block, and implement points-subtracting/bonus logic (Exalted)
        elsif 
            stat_choice_order.each do |source|
                if source == "player"
                    if stats[:points_player][:preset_nums]
                        index = 0
                        archetype[:stat_weights][:chosen_by_player].each do |stat|
                            output_character[:stats][:list][stat] = stats[:minimum_score] + stats[:points_player][:stat_priority][index]
                            index += 1
                        end
                    end
                if source == "class_race"
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
                                        output_character[:stats][:list][bonus_hash[:stat]] += bonus_hash[:bonus]
                                    end
                                end
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
    if game_system.system_skills.has_skills

    end


    # check powers
    if game_system.system_powers.has_powers

    end


    # check system_unique
    if system_unique[0]

    end

    
end