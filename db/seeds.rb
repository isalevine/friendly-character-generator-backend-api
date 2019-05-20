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


def fetch_tag_list
    # refactor to only grab ids based on SystemTag joins
    tag_list = Tag.all
    fetch_snippet_list(tag_list)
end


def fetch_snippet_list(tag_list)
    snippet_list = tag_list.map do |tag|
        tag.snippets.where(system_specific: nil)
    end
    byebug
end


parse_snippet_lists(corn_god_worshipping_wizard)
parse_snippet_lists(the_mime)

fetch_tag_list