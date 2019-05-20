

class ApplicationController < ActionController::API



    # Snippet generator logic


    def generate_snippet_pool(output_character)
        # refactor to only grab ids based on SystemTag joins
        all_tags = Tag.all
        tag_dictionary = generate_tag_dictionary(all_tags)
        search_pool = generate_search_pool(output_character)
        snippet_pool = fetch_snippet_pool(tag_dictionary, search_pool)
    end


    # THIS WILL BE A VERY SLOW METHOD! DO UNIT TESTING HERE!
    # (try to design frontend to run this during, like, card animations or something to not slow down app...)
    def generate_tag_dictionary(all_tags)
        # byebug
        tag_dictionary = {}
        all_tags.each do |tag|
            first_letter = tag.text.slice(0, 1)
            if !tag_dictionary.has_key?(first_letter)
                tag_dictionary[first_letter] = []
            end
            tag_dictionary[first_letter] << tag
        end
        # byebug
        tag_dictionary
    end


    def generate_search_pool(output_character)
        # SEE IF YOU CAN ALSO USE THE  playstyle_preference + form text  TO ALSO ADD TO POOL!
        #
        # refactor to lookup GameSystem with output_character[:game_system_id], and grab game_system[:unique_snippet_sources]
        unique_system_sources = $game_system_unique_snippet_sources || []
        string_pool = ""

        output_character.each do |key, value|
            if key == :class
                string_pool += " #{output_character[:class]}"

            elsif key == :race
                string_pool += " #{output_character[:race]}"

            elsif key == :archetype_name
                string_pool += " #{output_character[:archetype_name]}"

            elsif key == :skills
                output_character[:skills][:list].each do |skill_hash|
                    if skill_hash[:name]
                        string_pool += " #{skill_hash[:name]}"
                    end
                end

            # take :name and 1st sentence ONLY of :description
            elsif key == :powers
                output_character[:powers][:list].each do |power_hash|
                    if power_hash[:name]
                        sentence = power_hash[:description].split(". ")[0]
                        string_pool += " #{power_hash[:name]} #{sentence}"
                    end
                end

            elsif unique_system_sources.length > 0
                unique_system_sources.each do |string|
                    key = string.to_sym
                    string_pool += " #{output_character[:key]}"
                end
            end
            
        end

        search_pool = generate_tags(string_pool)
        
    end


    def fetch_snippet_pool(tag_dictionary, search_pool)
        # compare tag_dictionary verses search_pool to narrow down character-specific tags
                # snippet_list = tag_dictionary.map do |tag|
                #     tag.snippets.where(system_specific: nil)
                # end

                
        # not sure why multiples of snippets are ending up in snippet_pool - investigate!!
        snippet_pool = Set[] 
        # snippet_pool = []

        search_pool.each do |search_string|
            key = search_string.slice(0, 1)
            if tag_dictionary.has_key?(key)
                tag_dictionary[key].each do |tag_hash|
                    if tag_hash[:text] == search_string
                        tag_hash.snippets.each do |snippet|
                            snippet_pool << snippet
                        end
                    end
                end
            end 
        end
        
        sort_snippets_story_location(snippet_pool)
    end


    def sort_snippets_story_location(snippet_pool)
        sorted_snippet_pool = {
            "very_beginning": [],
            "near_beginning": [],
            "middle": [],
            "near_end": [],
            "very_end": []
        }
        snippet_pool.each do |snippet_hash|
            story_location = snippet_hash[:story_location].to_sym
            sorted_snippet_pool[story_location] << snippet_hash[:text]
        end    
        generate_character_backstory(sorted_snippet_pool)
    end


    def generate_character_backstory(sorted_snippet_pool)
        character_backstory = {
            "very_beginning": "",
            "near_beginning": "",
            "middle": "",
            "near_end": "",
            "very_end": "" 
        }
        sorted_snippet_pool.each do |story_location, snippet_array|
            random_index = (rand * snippet_array.length).floor
            character_backstory[story_location] = snippet_array[random_index]
        end
        character_backstory
        byebug
    end


end
