
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


        # term_conversions MUST BE BUILT IN EVENTUALLY (for Exalted stats...)
        # => see Skills below for term_conversions implementation
        #
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
        end


        # check skills
        if game_system[:system_skills][:has_skills]
            skills = game_system[:system_skills]
            conversions = game_system[:skill_conversions]
            skill_choice_order = []
            points = nil

            #determine order that point allocations will go in
            if skills[:chosen_by] == "both"
                # if !skills[:points_class_race][:spend_points][:spend_method] || skills[:points_class_race][:spend_points][:spend_method] == "bonus"
                #     skill_choice_order = ["player", "class_race"]
                # (!!! when uncommented, change next line to elsif !!!)
                if skills[:points_class_race][:spend_points][:spend_method] == "automatic" || skills[:points_class_race][:spend_points][:spend_method] == "subtract"
                    skill_choice_order = ["class_race", "player"]
                end
            # elsif skills[:chosen_by] == "player"
            #     skill_choice_order = ["player"]
            # elsif skills[:chosen_by] == "class_race"
            #     skill_choice_order = ["class_race"]
            end

            if skills[:points_num]
                points_to_spend = skills[:points_num]
                priority_index = 0

                skill_choice_order.each do |chooser|
                    chooser_key = ("points_" + chooser).to_sym
                    subtraction = false
                    if skills[chooser_key][:spend_points][:spend_method] == "automatic" || skills[chooser_key][:spend_points][:spend_method] == "bonus"
                        # no change
                    elsif skills[chooser_key][:spend_points][:spend_method] == "subtract"
                        subtraction = true
                    end

                    if chooser == "player"
                        skill_weight_index = 0

                        while points_to_spend > 0
                            archetype_skill = archetype[:skill_priorities][:chosen_by_player][priority_index]
                            priority_skill = nil

                            conversions[:term_conversions].each do |conversion_hash|
                                if conversion_hash[:base][:skill1] == archetype_skill
                                    output_skill1 = conversion_hash[:output][:skill1]
                                    output_skill2 = conversion_hash[:output][:skill2]
                                    if archetype[:system_unique][system_key][:output_skill_preferences].include?(output_skill1)
                                        priority_skill = output_skill1
                                    elsif archetype[:system_unique][system_key][:output_skill_preferences].include?(output_skill2)
                                        priority_skill = output_skill2
                                    end
                                end
                            end

                            skill_hash = {}
                            skill_hash[:name] = priority_skill
                            # integer math in Ruby will always take .floor of decimal - this is helpful for spending points!
                            # (will eventually need to deal with leftover points! => can you predict using % at start of point allocation??)
                            points_spent = ((skills[:points_num] * skills[:points_player][:spend_points][:skill_weights][skill_weight_index]) / 100)
                            skill_hash[:points] = skills[:minimum_score] + points_spent
                            output_character[:skills][:list] << skill_hash
                            priority_index += 1
                            skill_weight_index += 1
                            points_to_spend -= points_spent
                        end

                    elsif chooser == "class_race"
                        conversions[:chosen_by_class_race].each_value do |class_race_array|
                            class_race_array.each do |class_race_hash|
                                if !class_race_hash[:name]
                                    break
                                elsif class_race_hash[:name] == output_character[:class] || class_race_hash[:name] == output_character[:race]

                                    class_race_hash[:num_chosen].times do                                       
                                        priority_skill1 = nil
                                        priority_skill2 = nil

                                        if conversions[:base_output_conversions] == "1_to_2"
                                            archetype_skill = archetype[:skill_priorities][:chosen_by_player][priority_index]

                                            conversions[:term_conversions].each do |conversion_hash|
                                                if conversion_hash[:base][:skill1] == archetype_skill
                                                    priority_skill1 = conversion_hash[:output][:skill1]
                                                    priority_skill2 = conversion_hash[:output][:skill2]
                                                end
                                            end
                                        # elsif conversions[:base_output_conversions] == "2_to_1"
                                        # elsif conversions[:base_output_conversions] == "1_to_1"
                                        end

                                        class_race_hash[:list].each do |skill|
                                            skill_hash = {} 
                                            if skill[:skill] == priority_skill1
                                                skill_hash[:name] = priority_skill1
                                                skill_hash[:points] = skills[:minimum_score] + skill[:bonus]
                                                output_character[:skills][:list] << skill_hash
                                                # enable subtraction when ready to implement checking vs points_to_spend (refactor as while loop?)
                                                # => (see "if chooser == player" above for example...)
                                                # if subtraction
                                                #     points_to_spend -= skill[:bonus]
                                                # end
                                                break
                                            elsif skill[:skill] == priority_skill2
                                                skill_hash = {} 
                                                skill_hash[:name] = priority_skill2
                                                skill_hash[:points] = skills[:minimum_score] + skill[:bonus]
                                                output_character[:skills][:list] << skill_hash
                                                # enable subtraction when ready to implement checking vs points_to_spend (refactor as while loop?)
                                                # => (see "if chooser == player" above for example...)
                                                # if subtraction
                                                #     points_to_spend -= skill[:bonus]
                                                # end
                                                break
                                            end
                                        end
                                        priority_index += 1
                                    end
                                end
                            end
                        end
                    end
                end  
            else
                # do something
            end
        end


        # check powers
        if game_system[:system_powers][:has_powers]
            powers = game_system[:system_powers]
            power_choice_order = []

            if powers[:chosen_by] == "both"
                # logic to determine order...
            elsif powers[:chosen_by] == "player"
                # power_choice_order = ["player"]
            elsif powers[:chosen_by] == "class_race"
                power_choice_order = ["class_race"]
            end

            if powers[:points_num]
                points_to_spend = powers[:points_num]
                while points_to_spend > 0
                    powers[:search_tags].each do |chooser|
                        tag_key = ("chosen_by_" + chooser).to_sym
                        if tag_key = :chosen_by_class_race
                            powers[:power_list].each do |power_hash|
                                if power_hash[:tags][tag_key].include?(output_character[:class]) || power_hash[:tags][tag_key].include?(output_character[:race])
                                    shortened_power_hash = { name: power_hash[:name], roll: power_hash[:roll], description: power_hash[:description] }
                                    output_character[:powers][:list] << shortened_power_hash
                                    break
                                end
                            end
                        elsif tag_key = :chosen_by_player
                            # more complex logic needed - especially for requirements (super-nested hash)...
                        end

                    end
                    
                    points_to_spend -= 1
                end

            else
                # is this necessary? or we assume that ALL powers cost
                # 1 point, and MUST be subtracted (or just .times do)?
                #
                # do something(?)
            end
        end


        # check system_unique
        if game_system[:system_unique][0]
        end

        byebug

        self.format_text_output(output_character)
    end


    def self.format_text_output(output_character)
        output = File.open("test_output.txt", "w")
        output << "Race: #{output_character[:race]}\n"
        output << "Class: #{output_character[:class]}\n \n"
        output << "Abilities:\n"
            output << "Strength: #{output_character[:stats][:list][:strength]}\n"
            output << "Dexterity: #{output_character[:stats][:list][:dexterity]}\n"
            output << "Constitution: #{output_character[:stats][:list][:constitution]}\n"
            output << "Intelligence: #{output_character[:stats][:list][:intelligence]}\n"
            output << "Wisdom: #{output_character[:stats][:list][:wisdom]}\n"
            output << "Charisma: #{output_character[:stats][:list][:charisma]}\n \n"
        output << "Skills:\n"
            output << "#{output_character[:skills][:list][0][:name]}\n"
            output << "#{output_character[:skills][:list][1][:name]}\n"
            output << "#{output_character[:skills][:list][2][:name]}\n"
            output << "#{output_character[:skills][:list][3][:name]}\n \n"
        output << "Powers:\n"
            output << "#{output_character[:powers][:list][0][:name]}\n"
                output << "Roll: #{output_character[:powers][:list][0][:roll]}\n"
                output << "Description: #{output_character[:powers][:list][0][:description]}\n \n"
            output << "#{output_character[:powers][:list][1][:name]}\n \n"
                output << "Roll: #{output_character[:powers][:list][1][:roll]}\n"
                output << "Description: #{output_character[:powers][:list][1][:description]}\n \n"
        output.close
    end

end


Converter.archetype_system_converter(archetype, game_system, output_character)