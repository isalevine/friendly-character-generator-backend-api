
require 'byebug'

# QUESTIONS TO CONSIDER:
# 1. organize each hash into general: and system_unique: keys? (to allow for half-orc specific stuff in Dnd, and Solar stuff in Exalted)
# 2. does each snipped need to be a hash that also contains (filtered) tags for searching individually? 
#     => probably more efficient to search + gather tags WHEN CREATED, instead of during calculations
#     => also, this hash would probably need an attribute to store very_beginning/near_beginning/etc., instead of using them as keys

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



def parse_snippet_lists(object)
    object.each do |story_key, snippet_array|
        story_location = story_key.to_s
        create_snippets(story_location, snippet_array)
    end    
end

def create_snippets(story_location, snippet_array)
    snippet_array.each do |snippet_text|
        byebug
        # new_snippet = Snippet.create(story_location: story_location, text: snippet_text)
    end
end


# create tags, do not append to snippet yet (will require a new hash)
def generate_tags(archetype)
    output_array = []
    archetype.each_value do |array|
        regex1 = /(-)|(--)|(\.\.\.)/
        regex2 = /([.,:;?!"'`@#$%^&*()_+={}-])/
        filter_words = ["a", "an", "the", "of", "or", "in", "out", "above", "below", "with", "without", "their", "they", "them", "through", "as", "if", "from", "has", "have", "another", "always", "even", "since", "be", "and", "more", "by", "so", "what", "to", "at", "toward", "for", "was", "though", "could", "is", "on", "that", "like", "may", "but", "any", "about"]
        snippet = array[0]

        snippet.downcase!
        snippet.gsub!(regex1, " ")
        snippet.gsub!(regex2, "")
        snippet_array = snippet.split(" ")
        snippet_array.uniq!
        snippet_array.filter! { |word| !filter_words.include?(word) }

        output_array << snippet_array
    end


    puts "create_tags filtered snippet_array output:"
    output_array.each do |array|
        puts array
        puts
    end
end






parse_snippet_lists(the_mime)

generate_tags(the_mime)