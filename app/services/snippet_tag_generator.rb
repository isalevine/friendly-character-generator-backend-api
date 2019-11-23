require 'set'

class SnippetTagGenerator
    # move methods from seeds.rb here to generate snippets, then call SnippetTagGenerator in seeds.rb...

    def initialize
        @tag_list = Set[]
    end

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
        filter_words = Set["a", "an", "the", "and",
          "is", "of", "to", "be", "in", "they", "their", "them", "or", "if", "this", "like",
          "had", "but", "what", "with", "at",
        ]
    
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
            tag_id = nil
            if @tag_list.add?(tag)
                new_tag = Tag.create(text: tag)
                tag_id = new_tag.id
            else
                found_tag = Tag.find_by(text: tag)    
                tag_id = found_tag.id
            end
            create_snippet_tag_join(snippet_id, tag_id)
        end
    end
    
    
    def create_snippet_tag_join(snippet_id, tag_id)
        SnippetTag.create(snippet_id: snippet_id, tag_id: tag_id)
    end
end