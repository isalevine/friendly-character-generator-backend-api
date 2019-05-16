
def blank_dnd_output_character
    {
        class: nil,
        race: nil,
        archetype_name: nil,
        
        stats: {
            alias: "stat",
            list: {
                "strength": nil,
                "dexterity": nil,
                "constitution": nil,
                "intelligence": nil,
                "wisdom": nil,
                "charisma": nil
            }
        },
    
        skills: {
            alias: "skill",
            list: []
        },
    
        powers: {
            alias: "power",
            list: []
        },
    
        ability_modifiers: nil,
        alignment: nil,
        hit_die: nil,
        saving_throws: nil,
        hit_points: nil,
        armor_class: nil
    }
end


