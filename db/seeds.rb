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



# CODE BELOW COPIED FROM /app/test-logic-files/test-backstory...

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
        generate_tags(snippet_text, new_snippet.id)
    end
end


# create tags, do not append to snippet yet (will require a new hash)
def generate_tags(snippet_text, snippet_id)
    regex1 = /(-)|(--)|(\.\.\.)/
    regex2 = /([.,:;?!"'`@#$%^&*()_+={}-])/
    filter_words = ["a", "an", "the", "of", "or", "in", "out", "above", "below", "with", "without", "their", "they", "them", "through", "as", "if", "from", "has", "have", "another", "always", "even", "since", "be", "and", "more", "by", "so", "what", "to", "at", "toward", "for", "was", "though", "could", "is", "on", "that", "like", "may", "but", "any", "about"]

    snippet_text.downcase!
    snippet_text.gsub!(regex1, " ")
    snippet_text.gsub!(regex2, "")
    tag_array = snippet_text.split(" ")
    tag_array.uniq!
    tag_array.filter! { |tag| !filter_words.include?(tag) }

    puts "generate_tags output the following tag_array:"
    puts tag_array
    puts

    create_tags(tag_array, snippet_id)
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


def fetch_tag_ids
    tag_ids = Tag.all.map do |tag|
        tag.id
    end
    byebug
end



parse_snippet_lists(the_mime)

fetch_tag_ids