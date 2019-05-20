# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# SearchList.all.destroy_all
# SearchPreference.all.destroy_all
# Archetype.all.destroy_all
# BaseCharacter.all.destroy_all

# # playstyles: physical, mental, social
# # actions: [weapon, tank, sneak, spells], [spells, investigate, knowledge], [leader, perform, manipulate, seduce]
# # ??? DEPRECATE for only PLAYSTYLE and ACTIONS as search terms ???  stats: strength, stamina, dexterity, wisdom, intelligence, charisma
# # powers: any, damage, heal, stealth, mind, control

# warrior = Archetype.create(name: "Warrior")
# warrior_search_list = SearchList.create(archetype_id: warrior.id, search_playstyle_pref: "physical", search_action_pref: "weapon, tank", search_power_pref: "any")

# ninja = Archetype.create(name: "Ninja")
# ninja_search_list = SearchList.create(archetype_id: ninja.id, search_playstyle_pref: "physical, mental", search_action_pref: "sneak, investigate", search_power_pref: "any")

# wizard = Archetype.create(name: "Wizard")
# wizard_search_list = SearchList.create(archetype_id: wizard.id, search_playstyle_pref: "physical, mental", search_action_pref: "spells, knowledge", search_power_pref: "any")

# seducer = Archetype.create(name: "Seducer")
# seducer_search_list = SearchList.create(archetype_id: seducer.id, search_playstyle_pref: "social", search_action_pref: "leader, perform, manipulate, seduce", search_power_pref: "any")









Snippet.all.destroy_all
SnippetTag.all.destroy_all
Tag.all.destroy_all

require 'set'


# copied from output_character, caught in byebug by running 'ruby test-dnd-converter-logic.rb'
output_character1 = {:class=>"wizard", :race=>"gnome", :archetype_name=>"corn-god-worshipping wizard", :stats=>{:alias=>"stat", :list=>{:strength=>8, :dexterity=>13, :constitution=>12, :intelligence=>12, :wisdom=>15, :charisma=>15}}, :skills=>{:alias=>"skill", :list=>[{:name=>"arcana", :points=>1}, {:name=>"religion", :points=>1}, {:name=>"performance", :points=>1}, {:name=>"nature", :points=>1}]}, :powers=>{:alias=>"power", :list=>[{:name=>"Arcane Recovery", :tags=>{:chosen_by_class_race=>["wizard"], :chosen_by_player=>{:playstyle_preference=>[], :action_preference=>[], :power_preference=>[], :requirements=>{:stats=>[{:stat=>nil, :minimum=>nil}], :skills=>[{:skill=>nil, :minimum=>nil}], :class=>[{:includes=>[], :excludes=>[]}], :race=>[{:includes=>[], :excludes=>[]}]}}}, :roll=>"once per day", :description=>"You have learned to regain some of your magical energy by studying your spellbook. Once per day when you finish a short rest, you can choose expended spell slots to recover. You can recover either a 2nd-level spell slot or two 1st-level spell slots."}, {:name=>"Spellcasting", :tags=>{:chosen_by_class_race=>["bard", "cleric", "druid", "sorcerer", "wizard"], :chosen_by_player=>{:playstyle_preference=>[], :action_preference=>[], :power_preference=>[], :requirements=>{:stats=>[{:stat=>nil, :minimum=>nil}], :skills=>[{:skill=>nil, :minimum=>nil}], :class=>[{:includes=>[], :excludes=>[]}], :race=>[{:includes=>[], :excludes=>[]}]}}}, :roll=>"automatic", :description=>"An event in your past, or in the life of a parent or ancestor, left an indelible mark on you, infusing you with arcane magic. This font of magic, whatever its origin, fuels your spells. (NOTE: This feature is used in place of all other Spellcasting features.)"}]}, :ability_modifiers=>nil, :alignment=>nil, :hit_die=>nil, :saving_throws=>nil, :hit_points=>nil, :armor_class=>nil, :game_system_id=>1}
output_character2 = {:class=>"bard", :race=>"tiefling", :archetype_name=>"the_mime", :stats=>{:alias=>"stat", :list=>{:strength=>12, :dexterity=>13, :constitution=>10, :intelligence=>15, :wisdom=>8, :charisma=>17}}, :skills=>{:alias=>"skill", :list=>[{:name=>"performance", :points=>1}, {:name=>"insight", :points=>1}, {:name=>"deception", :points=>1}, {:name=>"perception", :points=>1}]}, :powers=>{:alias=>"power", :list=>[{:name=>"Bardic Inspiration", :tags=>{:chosen_by_class_race=>["bard"], :chosen_by_player=>{:playstyle_preference=>[], :action_preference=>[], :power_preference=>[], :requirements=>{:stats=>[{:stat=>nil, :minimum=>nil}], :skills=>[{:skill=>nil, :minimum=>nil}], :class=>[{:includes=>[], :excludes=>[]}], :race=>[{:includes=>[], :excludes=>[]}]}}}, :roll=>"d6", :description=>"You can inspire others through stirring words or music. To do so, you use a bonus action on your turn to choose one creature other than yourself within 60 feet of you who can hear you. That creature gains one Bardic Inspiration die, a d6. Once within the next 10 minutes, the creature can roll the die and add the number rolled to one ability check, attack roll, or saving throw it makes. Once the Bardic Inspiration die is rolled, it is lost. A creature can have only one Bardic Inspiration die at a time."}, {:name=>"Spellcasting", :tags=>{:chosen_by_class_race=>["bard", "cleric", "druid", "sorcerer", "wizard"], :chosen_by_player=>{:playstyle_preference=>[], :action_preference=>[], :power_preference=>[], :requirements=>{:stats=>[{:stat=>nil, :minimum=>nil}], :skills=>[{:skill=>nil, :minimum=>nil}], :class=>[{:includes=>[], :excludes=>[]}], :race=>[{:includes=>[], :excludes=>[]}]}}}, :roll=>"automatic", :description=>"An event in your past, or in the life of a parent or ancestor, left an indelible mark on you, infusing you with arcane magic. This font of magic, whatever its origin, fuels your spells. (NOTE: This feature is used in place of all other Spellcasting features.)"}]}, :ability_modifiers=>nil, :alignment=>nil, :hit_die=>nil, :saving_throws=>nil, :hit_points=>nil, :armor_class=>nil, :game_system_id=>1}

$game_system_unique_snippet_sources = ["alignment"]


# CODE BELOW COPIED FROM /app/test-logic-files/test-backstory... 
# (and expanded upon--refactor to merge and put files in correct place to test...)

big_sword_knight = {
    very_beginning: ["Birthed by an ironworker in an imperial steelmill during crunch-week for greatsword production, they were born with the smell of smelting metal in their nose and a fine coating of it in their lungs."],
    near_beginning: ["The first time they touched a sword was at two weeks old, and at two months they mastered using a knife at the kitchen table. At two years they were babysat by squires who allowed swords to be used as toys, and by age twelve they mastered the blade--and became knighted."],
    middle: ["Part of their oath is to only wield swords taller than they are--and they're pretty tall! Like 6-foot-something, at least.", "A fine military career was in the making, but they set off in search of a fabled swordsmith, who had already died by the time they found the old man's mountain workshop."],
    near_end: ["They now seek a new as-of-yet undiscovered swordsmith master, who will craft an unbreakable sword of unrivaled sharpness."],
    very_end: ["Since they sleep (and shower) in their full armor, they tend to reek--remember to do laundry before any stealth missions!"]
}


smooth_talking_ninja = {
    very_beginning: ["Raised by a clan of silent monk-ninjas, they internalized the raw power of both sound and silence from an early age."],
    near_beginning: ["They struck out in order to travel the world, and along the way, found themself in dark corners of the world--like forests at night, stowing away in the hull of a stinky ship, and probably being thrown into a castle dungeon at least once or twice."],
    middle: ["They mastered being part of the night itself--first by donning a fine black suit and being a socialite, then by adding a Batman-like cowl to said suit and skulking around, and finally doing both at the same time. And now it's all the time.", "Instead of throwing weapons, they threw words--mellifluous words like falling flower blossoms, and vitriolic words that cut deeper than any blade or shuriken. But sweet or harsh, their timing with witty one-liners is impeccable."],
    near_end: ["Now, they seek to infiltrate the highest echelons on polite, proper, and royal society--either by talking their way in, or sneaking. Either way, they can make a quick escape in the event of any embarrassing social foibles."],
    very_end: ["Seriously though, they love that Batman cowl. No idea if they have a grappling hook, or any other useful gear, but they for sure have that cowl."]
}


corn_god_worshipping_wizard = {
    very_beginning: ["Born in a barn on a farm far away, corn is all they have ever known. Maybe it's some kind of magical foreign corn? No one has any idea. The place might not even be real."],
    near_beginning: ["The corn has spoken to them, and has revealed the light and truth: the only true god is the Corn God, and they serve this god faithfully. So they set off on a pilgrimage, seeking avatars of this sacred corn in other lands."],
    middle: ["Along their journey, real magic came to them accidentally. Who knew that book would be full of step-by-step spell tutorials?", "Naturally, they interpreted their power as a gift from their god. They must invoke the god's name when casting any spell now--it might be a compulsion, or religion dogma, or actually part of the spells, but it's gotta happen."],
    near_end: ["Their pilgrimage has brought them to a new land, but no corn that represents the Corn God has been found. They continue searching, perhaps in vain."],
    very_end: ["By the way, they won't eat any corn. They will, however, gladly eat dirt that corn has grown in."]
}


the_mime = {
    very_beginning: ["As if from another world, a melody has always faintly played in their head, even since birth: 'the sound...of silence...'"],
    near_beginning: ["They discovered their magic could be invoked through gestures, and made more powerful by silence--and so, in becoming a mime, they have increased their magical powers tenfold. (Not sure what their starting point was, though.) They have traveled for many years without speaking, at least in public."],
    middle: ["At one point, they became a court jester for a small kingdom's ruler, and perfected the motley makeup and flamboyant style. They stuck with black-and-white stripes for clothes, and colorful diamonds for face makeup.", "The one time someone heard them speak in their natural voice, they immediately killed them in an alley--or so the rumor goes."],
    near_end: ["What drives them to wander about, waving their hands, weaving their spells? The people. But they never seem to make or keep any friends or lovers along the way...seems like a lonely existence. And yet, they continue on for that simple reason: the people."],
    very_end: ["(Yes, the rumor about them murdering someone is true.)"]
}


TAG_LIST = Set[]
def load_tag_list
    tags = Tag.all
    tags.each do |tag|
        TAG_LIST << tag.text
    end
end


def parse_snippet_lists(object)
    load_tag_list

    object.each do |story_key, snippet_array|
        story_location = story_key.to_s
        create_snippets(story_location, snippet_array)
    end    
end

def create_snippets(story_location, snippet_array)
    snippet_array.each do |snippet_text|
        # byebug
        new_snippet = Snippet.create(story_location: story_location, text: snippet_text, system_specific: nil)
        generate_tags(snippet_text, new_snippet.id, create_db_tags: true)
    end
end


# create tags, do not append to snippet yet (will require a new hash)
def generate_tags(snippet_text, snippet_id = nil, create_db_tags = false)
    regex1 = /(-)|(--)|(\.\.\.)|(_)/
    regex2 = /([.,:;?!"'`@#$%^&*()+={}-])/
    # filter list is being CUT DOWN to increase randomness of matches
    # => different behavior will be needed once many snippets are seeded
    # => CONSIDER: what is the ideal % of total Snippets to show up in pool?
    # => (currently, 9 / 24 for 'corn_god_worshipping_wizard')
    filter_words = ["a", "an", "the", "and"]

    snippet_text.downcase!
    snippet_text.gsub!(regex1, " ")
    snippet_text.gsub!(regex2, "")
    tag_array = snippet_text.split(" ")
    tag_array.uniq!
    tag_array.filter! { |tag| !filter_words.include?(tag) }

    puts "generate_tags output the following tag_array:"
    puts tag_array
    puts

    if create_db_tags
        create_tags(tag_array, snippet_id)
    else
        tag_array
    end
end


def create_tags(tag_array, snippet_id)
    tag_array.each do |tag|
        if TAG_LIST.add?(tag)
            new_tag = Tag.create(text: tag)
            create_snippet_tag_join(snippet_id, new_tag.id)
        end
    end
end


def create_snippet_tag_join(snippet_id, tag_id)
    SnippetTag.create(snippet_id: snippet_id, tag_id: tag_id)
end





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


parse_snippet_lists(big_sword_knight)
parse_snippet_lists(smooth_talking_ninja)
parse_snippet_lists(corn_god_worshipping_wizard)
parse_snippet_lists(the_mime)

generate_snippet_pool(output_character1)
generate_snippet_pool(output_character2)