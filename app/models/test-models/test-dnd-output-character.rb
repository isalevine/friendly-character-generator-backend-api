dnd_output_character_big_sword_knight = {
    class: "fighter",
    race: "half-orc",
    archetype_name: "big sword knight",
    
    stats: {
        alias: "ability",
        list: {
            "strength": 17,
            "dexterity": 13,
            "constitution": 15,
            "intelligence": 8,
            "wisdom": 12,
            "charisma": 10
        }
    },

    skills: {
        alias: "skill",
        list: ["athletics", "intimidation", "acrobatics", "perception"]
    }

    powers: {
        alias: "feature",
        list:
    }

    ability_modifiers: "8-9 = -1; 10-11 = 0; 12-13 = +1; 14-15 = +2; 16-17 = +3, 18-19 = +4"
    alignment: "chaotic-neutral",
    hit_die: "d10",
    saving_throws: "strength, constitution",
    hit_points: "roll d10, add Constitution modifier",
    armor_class: "armor base AC, add Dexterity modifier",

}