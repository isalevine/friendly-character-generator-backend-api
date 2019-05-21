

# Converter logic
# ===============================================================
class Converter
    def self.archetype_system_converter(archetype, game_system, output_character)
        system_key = game_system[:unique_name].to_sym
        output_character[:game_system_id] = game_system[:id]


        # set output-character's archetype_name to archetype's name, and add game_system's id
        output_character[:archetype_name] = archetype[:name]



        # check CLASS
        # =============================================================
        if game_system[:system_classes][:has_classes]
            output_character[:class] = archetype[:system_unique][system_key][:class]
        end


        # check RACE
        # =============================================================
        if game_system[:system_races][:has_races]
            output_character[:race] = archetype[:system_unique][system_key][:race]
        end


        # check STATS
        # =============================================================
        # term_conversions MUST BE BUILT IN EVENTUALLY (for Exalted stats...)
        # => see Skills below for term_conversions implementation
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
            
            # check if stats are allocated by spending a limited nunber of points
            if stats[:points_num]
                points = stats[:points_num]
                # check for choice_order + what spends the points (player/class/race)
                # modularize logic in elsif block, and implement points-subtracting/bonus logic (Exalted)
            else
                # stat points are preset--allocate according to presets in game_system
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



        # check SKILLS
        # =============================================================
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

            # check if skills are allocated by spending a limited number of points
            if skills[:points_num]
                points_to_spend = skills[:points_num]
                priority_index = 0

                # determine order that point allocations will go in
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
                        # only implement a while loop if subtraction is true?? 
                        # => refactor so that the block is modularized, and can be called in either a while or times loop based on subtraction??
                        while points_to_spend > 0
                        # points_to_spend.times do
                            archetype_skill = archetype[:skill_priorities][:chosen_by_player][priority_index]
                            priority_skill = nil

                            # (for 1-to-2 conversion) find correct output skill to prioritize from output_skill_preference list
                            # => will this need additional checks against max_points, like with "chosen_by_class_race" below??
                            conversions[:term_conversions].each do |conversion_hash|
                                # byebug
                                if conversion_hash[:base][:skill1] == archetype_skill
                                    output_skill1 = conversion_hash[:output][:skill1]
                                    output_skill2 = conversion_hash[:output][:skill2]
                                    if archetype[:system_unique][system_key][:output_skill_preferences].include?(output_skill1)
                                        priority_skill = output_skill1
                                    elsif archetype[:system_unique][system_key][:output_skill_preferences].include?(output_skill2)
                                        priority_skill = output_skill2
                                    else
                                        priority_skill = output_skill1
                                    end
                                end
                            end

                            # format skill output and shovel into output_character's skill list
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
                        # find matching class or race for conversion
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
                                                # byebug
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
                                            skill1_points_maxed = false
                                            skill2_points_maxed = false
                                            # byebug
                                            
                                            # check if skill max scores have been reached
                                            if output_character[:skills][:list].length > 0
                                                # byebug
                                                output_character[:skills][:list].each do |character_skill_hash|
                                                    # byebug
                                                    if character_skill_hash[:name] == priority_skill1 && character_skill_hash[:points] >= skills[:maximum_score]
                                                        skill1_points_maxed = true
                                                    end
                                                    if character_skill_hash[:name] == priority_skill2 && character_skill_hash[:points] >= skills[:maximum_score]
                                                        skill2_points_maxed = true
                                                    end
                                                end
                                            end

                                            # current logic: allocate all points to priority_skill1 until max is reached, then allocate to priority_skill2
                                            if skill[:skill] == priority_skill1 && !skill1_points_maxed
                                                # byebug
                                                skill_hash[:name] = priority_skill1
                                                skill_hash[:points] = skills[:minimum_score] + skill[:bonus]
                                                output_character[:skills][:list] << skill_hash
                                                # enable subtraction when ready to implement checking vs points_to_spend (refactor as while loop?)
                                                # => (see "if chooser == player" above for example...)
                                                # if subtraction
                                                #     points_to_spend -= skill[:bonus]
                                                # end
                                                break
                                            elsif skill[:skill] == priority_skill2 && !skill2_points_maxed
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


    
        # check POWERS
        # =============================================================
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

            # check if powers are allocated by spending a limited nunber of points
            if powers[:points_num]
                # points_to_spend = powers[:points_num]
                    powers[:search_tags].each do |chooser|
                        tag_key = ("chosen_by_" + chooser).to_sym
                        if tag_key == :chosen_by_class_race
                            powers[:power_list].each do |power_hash|
                                # byebug
                                if !power_hash[:name]
                                    break
                                # find matching powers by searching for tags with class/race
                                # (logic also prevents duplicating powers -- it presumes they are unique!)
                                elsif ( power_hash[:tags][tag_key].include?(output_character[:class]) || power_hash[:tags][tag_key].include?(output_character[:race]) ) && !output_character[:powers][:list].include?(power_hash)
                                    output_character[:powers][:list] << power_hash
                                end
                            end
                        elsif tag_key == :chosen_by_player
                            # more complex logic needed - especially for requirements (super-nested hash)...
                        end

                    end
                    
                    # points_to_spend -= 1
                # end

            else
                # do something(?)
            end
        end


        # check SYSTEM_UNIQUE
        # =============================================================
        if game_system[:system_unique][0]
            # do something
        end

        # output_character is ready
        byebug
        

        # self.load_snippets(output_character)



        self.format_text_output(output_character)
    end


    # QUERY LOGIC NOT WORKING: Tag, SnippetTag, and Snippet are not available in this file to test...
    # (consider migrating these tests to a testing folder? ask TCFs if 'rails test' or something does that)
    #
    # def self.load_snippets(output_character)
    #     # use output_character[:game_system_id] for snippet query below
    #     tag_list = Tag.all
    #     snippets = tag_list.map do |tag|
    #         tag.snippets.where(system_specific: nil)
    #     end
    #     byebug
    # end


    # formatting currently hardcoded -- start by building in iteration
    def self.format_text_output(output_character)
        filename = "test-output-#{output_character[:archetype_name]}.txt"
        output = File.open(filename, "w")
        output << "Dnd Character Sheet\n"
        output << "======================\n"
        output << "Archetype: #{output_character[:archetype_name]}\n"
        output << "Race: #{output_character[:race]}\n"
        output << "Class: #{output_character[:class]}\n \n"

        output << "Abilities:\n"
        output << "======================\n"
            output << "Strength: #{output_character[:stats][:list][:strength]}\n"
            output << "Dexterity: #{output_character[:stats][:list][:dexterity]}\n"
            output << "Constitution: #{output_character[:stats][:list][:constitution]}\n"
            output << "Intelligence: #{output_character[:stats][:list][:intelligence]}\n"
            output << "Wisdom: #{output_character[:stats][:list][:wisdom]}\n"
            output << "Charisma: #{output_character[:stats][:list][:charisma]}\n \n"

        output << "Skills:\n"
        output << "======================\n"
            output << "#{output_character[:skills][:list][0][:name]}\n"
            output << "#{output_character[:skills][:list][1][:name]}\n"
            output << "#{output_character[:skills][:list][2][:name]}\n"
            output << "#{output_character[:skills][:list][3][:name]}\n"
            if output_character[:skills][:list][4]
                output << "#{output_character[:skills][:list][4][:name]}\n"
            end
            if output_character[:skills][:list][5]
                output << "#{output_character[:skills][:list][5][:name]}\n"
            end
            output << "\n"

        output << "Powers:\n"
        output << "======================\n"
            output << "Power: #{output_character[:powers][:list][0][:name]}\n"
                output << "Roll: #{output_character[:powers][:list][0][:roll]}\n"
                output << "Description: #{output_character[:powers][:list][0][:description]}\n \n"
            output << "Power: #{output_character[:powers][:list][1][:name]}\n"
                output << "Roll: #{output_character[:powers][:list][1][:roll]}\n"
                output << "Description: #{output_character[:powers][:list][1][:description]}\n \n"
            if output_character[:powers][:list][2]
                output << "Power: #{output_character[:powers][:list][2][:name]}\n"
                    output << "Roll: #{output_character[:powers][:list][2][:roll]}\n"
                    output << "Description: #{output_character[:powers][:list][2][:description]}\n \n"

            end
        output.close
    end



    # benchmark testing methods
    def self.reset_test_time_counter
        $test_time_counter = 0
    end

    def self.start_test
        $test_time_start = Time.now
    end
    
    def self.end_test
        $test_time_end = Time.now
        test_time = $test_time_end - $test_time_start
        $test_time_counter += test_time
    end
    
    def self.output_test(text)
        puts "testing results for: " + text
        puts "$test_time_counter: " + $test_time_counter.to_s + " seconds"

        puts
        puts
    end

end