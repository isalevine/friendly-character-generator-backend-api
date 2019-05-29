# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)





SearchList.all.destroy_all
SearchPreference.all.destroy_all
Archetype.all.destroy_all
BaseCharacter.all.destroy_all
GameSystem.all.destroy_all

# # playstyles: physical, mental, social
# # actions: [weapon, tank, sneak, spells], [spells, investigate, knowledge], [leader, perform, manipulate, seduce]
# # ??? DEPRECATE for only PLAYSTYLE and ACTIONS as search terms ???  stats: strength, stamina, dexterity, wisdom, intelligence, charisma
# # powers: any, damage, heal, stealth, mind, control

# CONSIDER snippet_search_terms => have users enter any amount of text (copy-pasted class description, self-written story, list of terms, etc.)
# and have them be added to that array...

big_sword_knight = Archetype.create(
    name: "big sword knight",
    img_url: "http://pre09.deviantart.net/0a83/th/pre/f/2016/125/5/c/yhorm_the_giant_by_yare_yare_dong-da1g9ju.png",

    stat_priorities: {
      chosen_by_player: [
        "strength",
        "constitution",
        "dexterity",
        "wisdom",
        "charisma",
        "intelligence"
      ]
    },
  
    skill_priorities: {
      chosen_by_player: [
        "feats_of_strength",
        "intimidation",
        "athletics_dodge",
        "awareness",
        "larceny_crime",
        "investigation",
        nil,
        nil,
        nil,
        nil,
        nil,
        nil
      ]
    },
  
    power_priorities: {
      chosen_by_player: {
        tags: ["sword", "combat", "extra attacks", "accuracy", "strength", "dodge", "reduce damage", "intimidate",]
      },
      spell_priorities: {}
    },

    snippet_search_terms: ["fight", "attack", "slay", "defend", "mercenary", "military", "journey", "mountain", "cold", "unbreakable", "foes",],
  
    system_unique: {
      dnd_5th_001: {
        class: "fighter",
        race: "half-orc",
        hit_points: "roll d10, add Constitution modifier",
        armor_class: "armor base AC, add Dexterity modifier",
        alignment: "chaotic-neutral",
        ability_modifiers: "8-9 = -1; 10-11 = 0; 12-13 = +1; 14-15 = +2; 16-17 = +3, 18-19 = +4",
        output_skill_preferences: ["perception", "acrobatics", "athletics"]
      },
      exalted_2nd_001: {
        class: "dawn",
        race: "solar exalted",
        anima: "big sword with angel wings",
        backgrounds: "artifact: 3 (daiklave), resources: 3 (armor, traveling gear, and lots of tavern-drinking), manse: 1 (delerium orb - lvl 1 fire stone, grants berserk/combat bonus)",
        equipment: "Daiklave (giant magical golden sword), heavy plate armor, traveling gear with plenty of cash, magic stone: Delirium Orb - go berserk, lose control but gain combat bonus",
        virtues: "valor: 4, conviction: 3, temperence: 1, compassion: 1",
        virtue_flaw: "valor - will try to fight and conquer anything bigger than their sword",
        willpower: "7",
        hit_points: "-0: 1, -1: 2, -2: 2, -4: 1, I: 1",
        soak: "bashing: , lethal: , aggravated: ",
        defense_values: "dodge: , parry: , mental: ",
        essence: "level 2, personal: 13 motes, peripheral: 30 motes",
        bonus_points: "18",
        output_stat_preferences: [],
        output_skill_preferences: [],
        output_power_preferences: []
      }
    }
)
big_sword_knight_search_list = SearchList.create(archetype_id: big_sword_knight.id, search_playstyle_pref: "physical", search_action_pref: "weapon, tank", search_power_pref: "any")


smooth_talking_ninja = Archetype.create(
  name: "smooth-talking ninja",
  img_url: "https://cdn.imgbin.com/13/7/1/imgbin-tuxedo-mask-sailor-moon-tuxedo-4EHfHP0XqxerFq4eHTrrjL55P.jpg",

  stat_priorities: {
    chosen_by_player: [
      "dexterity",
      "charisma",
      "intelligence",
      "wisdom",
      "strength",
      "constitution"
    ]
  },

  skill_priorities: {
    chosen_by_player: [
      "stealth",
      "athletics_dodge",
      "persuasion",
      "socialize",
      "larceny_crime",
      "deception",
      nil,
      nil,
      nil,
      nil,
      nil,
      nil
    ]
  },

  power_priorities: {
    chosen_by_player: {
      tags: ["stealth", "persuasion", "socialize", "deception", "disguise", "dodge"]
    },
    spell_priorities: {}
  },

  snippet_search_terms: ["sneaky", "night", "dark", "shadow", "hide", "talk", "charm", "polite", "society", "throwing", "knife", "treasure", "journey",],

  system_unique: {
    dnd_5th_001: {
      class: "rogue",
      race: "half-elf",
      hit_points: "roll d10, add Constitution modifier",
      armor_class: "armor base AC, add Dexterity modifier",
      alignment: "true-neutral",
      ability_modifiers: "8-9 = -1; 10-11 = 0; 12-13 = +1; 14-15 = +2; 16-17 = +3, 18-19 = +4",
      output_skill_preferences: ["perception", "acrobatics", "athletics", "sleight_of_hand", "investigation", "insight"]
    },
    exalted_2nd_001: {
      class: "night",
      race: "solar exalted",
      anima: "red lips dripping golden honey",
      backgrounds: "contacts: 3, backing: 2, resources: 2",
      equipment: "a perfectly-pressed suit that's dark as night, and holds a batman-like cowl inside it",
      virtues: "valor: 3, conviction: 1, temperence: 3, compassion: 2",
      virtue_flaw: "temperence - will give up trying to control their mooching, lecherous ways",
      willpower: "6",
      hit_points: "-0: 1, -1: 2, -2: 2, -4: 1, I: 1",
      soak: "bashing: , lethal: , aggravated: ",
      defense_values: "dodge: , parry: , mental: ",
      essence: "level 2, personal: motes, peripheral: motes",
      bonus_points: "18",
      output_stat_preferences: [],
      output_skill_preferences: [],
      output_power_preferences: []
    }
  }
)
ninja_search_list = SearchList.create(archetype_id: smooth_talking_ninja.id, search_playstyle_pref: "physical, mental", search_action_pref: "sneak, investigate", search_power_pref: "any")


corn_god_worshipping_wizard = Archetype.create(
    name: "corn-god-worshipping wizard",
    img_url: "https://cdn.drawception.com/images/panels/2012/4-2/WQrqFWaCwO-12.png",

    stat_priorities: {
      chosen_by_player: [
        "wisdom",
        "charisma",
        "dexterity",
        "constitution",
        "intelligence",
        "strength"
      ]
    },
  
    skill_priorities: {
      chosen_by_player: [
        "magic_computer",
        "magic_computer",
        "performance",
        "awareness",
        "socialize",
        "persuasion",
        nil,
        nil,
        nil,
        nil,
        nil,
        nil
      ]
    },
  
    power_priorities: {
      chosen_by_player: {
        tags: ["nature", "religion", "spells", "destruction", "growth", "healing", "divination"]
      },
      spell_priorities: {}
    },

    snippet_search_terms: ["power", "cast", "cult", "worship", "idols", "studying", "spells", "visions", "dark", "journey", "water",],
  
    system_unique: {
      dnd_5th_001: {
        class: "wizard",
        race: "gnome",
        hit_points: "roll d10, add Constitution modifier",
        armor_class: "armor base AC, add Dexterity modifier",
        alignment: "chaotic-good",
        ability_modifiers: "8-9 = -1; 10-11 = 0; 12-13 = +1; 14-15 = +2; 16-17 = +3, 18-19 = +4",
        output_skill_preferences: ["arcana", "religion", "nature"]
      },
      exalted_2nd_001: {
        class: "twilight",
        race: "solar exalted",
        anima: "deep swirling void filled with ears of corn",
        backgrounds: "backing: 3, influence: 3, resources: 1",
        equipment: "just robes and a staff that looks like a broken hoe. no shoes.",
        virtues: "valor: 1, conviction: 4, temperence: 1, compassion: 3",
        virtue_flaw: "conviction - burn all plants, crops, and living things to make way for a world of corn",
        willpower: "7",
        hit_points: "-0: 1, -1: 2, -2: 2, -4: 1, I: 1",
        soak: "bashing: , lethal: , aggravated: ",
        defense_values: "dodge: , parry: , mental: ",
        essence: "level 2, personal: motes, peripheral: motes",
        bonus_points: "18",
        output_stat_preferences: [],
        output_skill_preferences: [],
        output_power_preferences: []
      }
    }  
)
wizard_search_list = SearchList.create(archetype_id: corn_god_worshipping_wizard.id, search_playstyle_pref: "physical, mental", search_action_pref: "spells, knowledge", search_power_pref: "any")


the_mime = Archetype.create(
  name: "the mime",   
  img_url: "https://data.whicdn.com/images/130762762/large.jpg",

  stat_priorities: {
  chosen_by_player: [
    "charisma",
    "intelligence",
    "dexterity",
    "strength",
    "constitution",
    "wisdom"
  ]
  },
  skill_priorities: {
    chosen_by_player: [
      "performance",
      "socialize",
      "athletics_dodge",
      "deception",
      "awareness",
      "larceny_crime",
      nil,
      nil,
      nil,
      nil,
      nil,
      nil
    ]
  },
  power_priorities: {
    chosen_by_player: {
      tags: ["acrobatics", "socialize", "deception", "performance"]
    },
    spell_priorities: {}
  },

  snippet_search_terms: ["hands", "gestures", "silence", "performance", "traveling", "dark", "charm", "social", "jester", "killed", "journey", "lewd",],

  system_unique: {
    dnd_5th_001: {
      class: "bard",
      race: "tiefling",
      hit_points: "roll d10, add Constitution modifier",
      armor_class: "armor base AC, add Dexterity modifier",
      alignment: "lawful-evil",
      ability_modifiers: "8-9 = -1; 10-11 = 0; 12-13 = +1; 14-15 = +2; 16-17 = +3, 18-19 = +4",
      output_skill_preferences: ["sleight_of_hand", "insight", "perception"]
    },
    exalted_2nd_001: {
      class: "eclipse",
      race: "solar exalted",
      anima: "hands engulfed in golden fire signing inappropriate words in ASL",
      backgrounds: "resources: 2, manse: 3 (Psychic Walkie-Talkie Orb), contacts: 2",
      equipment: "striped mime suit, mickey mouse gloves, flawless motley makeup, and a magic orb that allows speechless & telepathic communication up to 200 yards away",
      virtues: "valor: 2, conviction: 1, temperence: 4, compassion: 2",
      virtue_flaw: "temperence - will continue giving up actions until a completely motionless ascetic",
      willpower: "6",
      hit_points: "-0: 1, -1: 2, -2: 2, -4: 1, I: 1",
      soak: "bashing: , lethal: , aggravated: ",
      defense_values: "dodge: , parry: , mental: ",
      essence: "level 2, personal: motes, peripheral: motes",
      bonus_points: "18",
      output_stat_preferences: [],
      output_skill_preferences: [],
      output_power_preferences: []
    }
  }
)
the_mime_search_list = SearchList.create(archetype_id: the_mime.id, search_playstyle_pref: "social", search_action_pref: "leader, perform, manipulate, seduce", search_power_pref: "any")




dnd_game_system = GameSystem.create(
    full_title: "Dungeons and Dragons",
    edition: "5th",
    alias: "dnd",
    unique_name: "dnd_5th_001",
    description: "Dungeons and Dragons, 5th Edition (core, with minor tweaks/simplifications for simplifying coding)",

    system_classes: {
        has_classes: true,
        class_alias: "class",
        chosen_by: "player",
        class_num: 12,
        class_list: ["barbarian", "bard", "cleric", "druid", "fighter", "monk", "paladin", "ranger", "rogue", "sorcerer", "warlock", "wizard"],
        has_stat_bonus: true,
        has_skill_bonus: true,
        has_set_powers: true,
        parameter_list: ["hit die", "saving throws", "equipment", nil, nil]
    },

    system_races: {
        has_races: true,
        race_alias: "race",
        chosen_by: "player",
        race_num: 9,
        race_list: ["dragonborn", "dwarf", "elf", "gnome", "half-elf", "halfling", "half-orc", "human", "tiefling"],
        has_stat_bonus: true,
        has_skill_bonus: true,
        has_set_powers: true,
        parameter_list: ["traits", nil, nil, nil, nil]
    },

    system_stats: {
        stat_alias: "ability",
        has_stats: true,
        chosen_by: "both",
        points_num: nil,
        points_player: {
        preset: {
            preset_nums: true,
            stat_priority: [7, 6, 5, 4, 2, 0]
        },
        spend_points: {
            spend_method: nil,
            stat_weights: []
        }
        },
        points_class_race: {
        preset: {
            preset_nums: false,
            stat_priority: []
        },
        spend_points: {
            spend_method: nil,
            stat_weights: []
        }
        },
        minimum_score: 8,
        maximum_score: 20,
        stat_num: 6,
        stat_list: ["strength", "dexterity", "constitution", "intelligence", "wisdom", "charisma", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    },

    system_skills: {
        skill_alias: "skill",
        has_skills: true,
        chosen_by: "class_race",
        points_num: 2,
        points_player: {
        preset: {
            preset_nums: false,
            skill_priority: [],
        },
        spend_points: {
            spend_method: "subtract",
            skill_weights: [50, 50]
        }
        },
        points_class_race: {
        preset: {
            preset_nums: false,
            skill_priority: []
        },
        spend_points: {
            spend_method: "automatic",
            skill_weights: []
        }
        },
        minimum_score: 0,
        maximum_score: 1,
        skill_num: 18,
        skill_list: ["acrobatics", "animal_handling", "arcana", "athletics", "deception", "history", "insight", "intimidation", "investigation", "medicine", "nature", "perception", "performance", "persuasion", "religion", "sleight_of_hand", "stealth", "survival", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    },

    system_powers: {
        power_alias: "feature",
        has_powers: true,
        chosen_by: "class_race",
        search_tags: ["class_race"],
        points_num: 3,
        power_num: 23,
        power_list: [
        { name: "Arcane Recovery", tags: {chosen_by_class_race: ["wizard"], chosen_by_player: { playstyle_preference: [], action_preference: [], power_preference: [], requirements: { stats: [ {stat: nil, minimum: nil} ], skills: [ {skill: nil, minimum: nil} ], class: [ {includes: [], excludes: [] } ], race: [ {includes: [], excludes: [] } ] } } }, roll: "once per day", description: "You have learned to regain some of your magical energy by studying your spellbook. Once per day when you finish a short rest, you can choose expended spell slots to recover. You can recover either a 2nd-level spell slot or two 1st-level spell slots."},
        { name: "Bardic Inspiration", tags: {chosen_by_class_race: ["bard"], chosen_by_player: { playstyle_preference: [], action_preference: [], power_preference: [], requirements: { stats: [ {stat: nil, minimum: nil} ], skills: [ {skill: nil, minimum: nil} ], class: [ {includes: [], excludes: [] } ], race: [ {includes: [], excludes: [] } ] } } }, roll: "d6", description: "You can inspire others through stirring words or music. To do so, you use a bonus action on your turn to choose one creature other than yourself within 60 feet of you who can hear you. That creature gains one Bardic Inspiration die, a d6. Once within the next 10 minutes, the creature can roll the die and add the number rolled to one ability check, attack roll, or saving throw it makes. Once the Bardic Inspiration die is rolled, it is lost. A creature can have only one Bardic Inspiration die at a time." },
        { name: "Bonus Proficiency", tags: {chosen_by_class_race: [], chosen_by_player: { playstyle_preference: [], action_preference: [], power_preference: [], requirements: { stats: [ {stat: nil, minimum: nil} ], skills: [ {skill: nil, minimum: nil} ], class: [ {includes: [], excludes: [] } ], race: [ {includes: [], excludes: [] } ] } } }, roll: "automatic", description: "When you choose this domain at 1st level, you gain proficiency with heavy armor." },
        { name: "Choose: Dragon Ancestor", tags: {chosen_by_class_race: [], chosen_by_player: { playstyle_preference: [], action_preference: [], power_preference: [], requirements: { stats: [ {stat: nil, minimum: nil} ], skills: [ {skill: nil, minimum: nil} ], class: [ {includes: [], excludes: [] } ], race: [ {includes: [], excludes: [] } ] } } }, roll: "automatic", description: "At 1st level, you choose one type of dragon as your ancestor. The damage type associated with each dragon is used by features you gain later. You can speak, read, and write Draconic. Additionally, whenever you make a Charisma check when interacting with dragons, your proficiency bonus is doubled if it applies to the check." },
        { name: "Choose: Expertise 1 (skill or thieves tools)", tags: {chosen_by_class_race: ["rogue"], chosen_by_player: { playstyle_preference: [], action_preference: [], power_preference: [], requirements: { stats: [ {stat: nil, minimum: nil} ], skills: [ {skill: nil, minimum: nil} ], class: [ {includes: [], excludes: [] } ], race: [ {includes: [], excludes: [] } ] } } }, roll: "double proficiency bonus", description: "At 1st level, choose two of your skill proficiencies, or one of your skill proficiencies and your proficiency with thieves tools. Your proficiency bonus is doubled for any ability check you make that uses either of the chosen proficiencies." },
        { name: "Choose: Fighting Style", tags: {chosen_by_class_race: ["fighter"], chosen_by_player: { playstyle_preference: [], action_preference: [], power_preference: [], requirements: { stats: [ {stat: nil, minimum: nil} ], skills: [ {skill: nil, minimum: nil} ], class: [ {includes: [], excludes: [] } ], race: [ {includes: [], excludes: [] } ] } } }, roll: "automatic", description: "You adopt a particular style of fighting as your specialty. Choose one of the following options: Archery, Defense, Dueling, Great Weapon Fighting, Protection, or Two-Weapon Fighting. You can’t take a Fighting Style option more than once, even if you later get to choose again." },
        { name: "Divine Domain", tags: {chosen_by_class_race: ["cleric"], chosen_by_player: { playstyle_preference: [], action_preference: [], power_preference: [], requirements: { stats: [ {stat: nil, minimum: nil} ], skills: [ {skill: nil, minimum: nil} ], class: [ {includes: [], excludes: [] } ], race: [ {includes: [], excludes: [] } ] } } }, roll: "automatic", description: "Choose one domain related to your deity: Knowledge, Life, Light, Nature, Tempest, Trickery, or War. Your domain grants you domain spells and other features when you choose it at 1st level. (From Domain Spells 1 Feature:) Each domain has a list of spells—its domain spells— that you gain at the cleric levels noted in the domain description. Once you gain a domain spell, you always have it prepared, and it doesn’t count against the number of spells you can prepare each day." },
        { name: "Divine Sense", tags: {chosen_by_class_race: ["paladin"], chosen_by_player: { playstyle_preference: [], action_preference: [], power_preference: [], requirements: { stats: [ {stat: nil, minimum: nil} ], skills: [ {skill: nil, minimum: nil} ], class: [ {includes: [], excludes: [] } ], race: [ {includes: [], excludes: [] } ] } } }, roll: "uses per day: 1 + Constitution modifier", description: "The presence of strong evil registers on your senses like a noxious odor, and powerful good rings like heavenly music in your ears. As an action, you can open your awareness to detect such forces. Until the end of your next turn, you know the location of any celestial, fiend, or undead within 60 feet of you that is not behind total cover. You know the type (celestial, fiend, or undead) of any being whose presence you sense, but not its identity. Within the same radius, you also detect the presence of any place or object that has been consecrated or desecrated, as with the hallow spell. You can use this feature a number of times equal to 1 + your Charisma modifier. When you finish a long rest, you regain all expended uses." },
        { name: "Druidic", tags: {chosen_by_class_race: ["druid"], chosen_by_player: { playstyle_preference: [], action_preference: [], power_preference: [], requirements: { stats: [ {stat: nil, minimum: nil} ], skills: [ {skill: nil, minimum: nil} ], class: [ {includes: [], excludes: [] } ], race: [ {includes: [], excludes: [] } ] } } }, roll: "automatic", description: "You know Druidic, the secret language of druids. You can speak the language and use it to leave hidden messages. You and others who know this language automatically spot such a message. Others spot the message's presence with a successful DC 15 Wisdom (Perception) check but can't decipher it without magic." },
        { name: "Favored Enemy (Choose 1)", tags: {chosen_by_class_race: ["ranger"], chosen_by_player: { playstyle_preference: [], action_preference: [], power_preference: [], requirements: { stats: [ {stat: nil, minimum: nil} ], skills: [ {skill: nil, minimum: nil} ], class: [ {includes: [], excludes: [] } ], race: [ {includes: [], excludes: [] } ] } } }, roll: "bonus to Wisdom, Intelligence, Survival checks", description: "Beginning at 1st level, you have significant experience studying, tracking, hunting, and even talking to a certain type of enemy. Choose a type of favored enemy: aberrations, beasts, celestials, constructs, dragons, elementals, fey, fiends, giants, monstrosities, oozes, plants, or undead. You have advantage on Wisdom (Survival) checks to track your favored enemies, as well as on Intelligence checks to recall information about them." },
        { name: "Lay On Hands", tags: {chosen_by_class_race: ["paladin"], chosen_by_player: { playstyle_preference: [], action_preference: [], power_preference: [], requirements: { stats: [ {stat: nil, minimum: nil} ], skills: [ {skill: nil, minimum: nil} ], class: [ {includes: [], excludes: [] } ], race: [ {includes: [], excludes: [] } ] } } }, roll: "restore hit points", description: "Your blessed touch can heal wounds. You have a pool of healing power that replenishes when you take a long rest. With that pool, you can restore a total number of hit points equal to your paladin level × 5. As an action, you can touch a creature and draw power from the pool to restore a number of hit points to that creature, up to the maximum amount remaining in your pool. Alternatively, you can expend 5 hit points from your pool of healing to cure the target of one disease or neutralize one poison affecting it. You can cure multiple diseases and neutralize multiple poisons with a single use of Lay on Hands, expending hit points separately for each one.This feature has no effect on undead and constructs." },
        { name: "Martial Arts", tags: {chosen_by_class_race: ["monk"], chosen_by_player: { playstyle_preference: [], action_preference: [], power_preference: [], requirements: { stats: [ {stat: nil, minimum: nil} ], skills: [ {skill: nil, minimum: nil} ], class: [ {includes: [], excludes: [] } ], race: [ {includes: [], excludes: [] } ] } } }, roll: "when only using monk equipment", description: "At 1st level, your practice of martial arts gives you mastery of combat styles that use unarmed strikes and monk weapons, which are shortswords and any simple melee weapons that don’t have the two- handed or heavy property. You gain the following benefits while you are unarmed or wielding only monk weapons and you aren’t wearing armor or wielding a shield: 1) You can use Dexterity instead of Strength for the attack and damage rolls of your unarmed strikes and monk weapons. 2) You can roll a d4 in place of the normal damage of your unarmed strike or monk weapon. 3) When you use the Attack action with an unarmed strike or a monk weapon on your turn, you can make one unarmed strike as a bonus action." },
        { name: "Natural Explorer (1 terrain type)", tags: {chosen_by_class_race: ["ranger"], chosen_by_player: { playstyle_preference: [], action_preference: [], power_preference: [], requirements: { stats: [ {stat: nil, minimum: nil} ], skills: [ {skill: nil, minimum: nil} ], class: [ {includes: [], excludes: [] } ], race: [ {includes: [], excludes: [] } ] } } }, roll: "Intelligence or Wisdom check", description: "You are particularly familiar with one type of natural environment and are adept at traveling and surviving in such regions. Choose one type of favored terrain: arctic, coast, desert, forest, grassland, mountain, or swamp. When you make an Intelligence or Wisdom check related to your favored terrain, your proficiency bonus is doubled if you are using a skill that you’re proficient in. While traveling for an hour or more in your favored terrain, you gain the following benefits: 1) Difficult terrain doesn’t slow your group’s travel. 2) Your group can’t become lost except by magical means. 3) Even when you are engaged in another activity while traveling (such as foraging, navigating, or tracking), you remain alert to danger. 4) If you are traveling alone, you can move stealthily at a normal pace. 5) When you forage, you find twice as much food as you normally would. 6) While tracking other creatures, you also learn their exact number, their sizes, and how long ago they passed through the area." },
        { name: "Otherworldly Patron", tags: {chosen_by_class_race: ["warlock"], chosen_by_player: { playstyle_preference: [], action_preference: [], power_preference: [], requirements: { stats: [ {stat: nil, minimum: nil} ], skills: [ {skill: nil, minimum: nil} ], class: [ {includes: [], excludes: [] } ], race: [ {includes: [], excludes: [] } ] } } }, roll: "automatic", description: "At 1st level, you have struck a bargain with an otherworldly being of your choice: the Archfey, the Fiend, or the Great Old One, each of which is detailed at the end of the class description." },
        { name: "Pact Magic", tags: {chosen_by_class_race: ["warlock"], chosen_by_player: { playstyle_preference: [], action_preference: [], power_preference: [], requirements: { stats: [ {stat: nil, minimum: nil} ], skills: [ {skill: nil, minimum: nil} ], class: [ {includes: [], excludes: [] } ], race: [ {includes: [], excludes: [] } ] } } }, roll: "automatic", description: "Your arcane research and the magic bestowed on you by your patron have given you facility with spells." },
        { name: "Rage", tags: {chosen_by_class_race: ["barbarian"], chosen_by_player: { playstyle_preference: [], action_preference: [], power_preference: [], requirements: { stats: [ {stat: nil, minimum: nil} ], skills: [ {skill: nil, minimum: nil} ], class: [ {includes: [], excludes: [] } ], race: [ {includes: [], excludes: [] } ] } } }, roll: "use as bonus action", description: "In battle, you fight with primal ferocity. On your turn, you can enter a rage as a bonus action. While raging, you gain the following benefits if you are not wearing heavy armor: 1) You have advantage on Strength checks and Strength saving throws. 2) When you make a melee weapon Attack using Strength, you gain a +2 bonus to the damage roll. This bonus increases as you level. 3) You have Resistance to bludgeoning, piercing, and slashing damage. Your rage lasts for 1 minute. It ends early if you are knocked Unconscious or if Your Turn ends and you have not attacked a hostile creature since your last turn or taken damage since then. You can also end your rage on Your Turn as a Bonus Action. Once you have raged the maximum number of times for your barbarian level, you must finish a Long Rest before you can rage again." },
        { name: "Second Wind", tags: {chosen_by_class_race: ["fighter"], chosen_by_player: { playstyle_preference: [], action_preference: [], power_preference: [], requirements: { stats: [ {stat: nil, minimum: nil} ], skills: [ {skill: nil, minimum: nil} ], class: [ {includes: [], excludes: [] } ], race: [ {includes: [], excludes: [] } ] } } }, roll: "use as bonus action", description: "You have a limited well of stamina that you can draw on to protect yourself from harm. On your turn, you can use a bonus action to regain hit points equal to 1d10 + your fighter level. Once you use this feature, you must finish a short or long rest before you can use it again." },
        { name: "Sneak Attack", tags: {chosen_by_class_race: ["rogue"], chosen_by_player: { playstyle_preference: [], action_preference: [], power_preference: [], requirements: { stats: [ {stat: nil, minimum: nil} ], skills: [ {skill: nil, minimum: nil} ], class: [ {includes: [], excludes: [] } ], race: [ {includes: [], excludes: [] } ] } } }, roll: "extra 1d6 damage", description: "Beginning at 1st level, you know how to strike subtly and exploit a foe’s distraction. Once per turn, you can deal an extra 1d6 damage to one creature you hit with an attack if you have advantage on the attack roll. The attack must use a finesse or a ranged weapon. You don’t need advantage on the attack roll if another enemy of the target is within 5 feet of it, that enemy isn’t incapacitated, and you don’t have disadvantage on the attack roll." },
        { name: "Sorcerous Origin", tags: {chosen_by_class_race: ["sorcerer"], chosen_by_player: { playstyle_preference: [], action_preference: [], power_preference: [], requirements: { stats: [ {stat: nil, minimum: nil} ], skills: [ {skill: nil, minimum: nil} ], class: [ {includes: [], excludes: [] } ], race: [ {includes: [], excludes: [] } ] } } }, roll: "automatic", description: "Choose a sorcerous origin, which describes the source of your innate magical power: Draconic Bloodline or Wild Magic, both detailed at the end of the class description." },
        { name: "Spellcasting", tags: {chosen_by_class_race: ["bard", "cleric", "druid", "sorcerer", "wizard"], chosen_by_player: { playstyle_preference: [], action_preference: [], power_preference: [], requirements: { stats: [ {stat: nil, minimum: nil} ], skills: [ {skill: nil, minimum: nil} ], class: [ {includes: [], excludes: [] } ], race: [ {includes: [], excludes: [] } ] } } }, roll: "automatic", description: "An event in your past, or in the life of a parent or ancestor, left an indelible mark on you, infusing you with arcane magic. This font of magic, whatever its origin, fuels your spells. (NOTE: This feature is used in place of all other Spellcasting features.)" },
        { name: "Thieves Cant", tags: {chosen_by_class_race: ["rogue"], chosen_by_player: { playstyle_preference: [], action_preference: [], power_preference: [], requirements: { stats: [ {stat: nil, minimum: nil} ], skills: [ {skill: nil, minimum: nil} ], class: [ {includes: [], excludes: [] } ], race: [ {includes: [], excludes: [] } ] } } }, roll: "automatic", description: "During your rogue training you learned thieves cant, a secret mix of dialect, jargon, and code that allows you to hide messages in seemingly normal conversation. Only another creature that knows thieves cant understands such messages. It takes four times longer to convey such a message than it does to speak the same idea plainly. In addition, you understand a set of secret signs and symbols used to convey short, simple messages, such as whether an area is dangerous or the territory of a thieves guild, whether loot is nearby, or whether the people in an area are easy marks or will provide a safe house for thieves on the run." },
        { name: "Unarmored Defense (Wisdom)", tags: {chosen_by_class_race: ["monk"], chosen_by_player: { playstyle_preference: [], action_preference: [], power_preference: [], requirements: { stats: [ {stat: nil, minimum: nil} ], skills: [ {skill: nil, minimum: nil} ], class: [ {includes: [], excludes: [] } ], race: [ {includes: [], excludes: [] } ] } } }, roll: "see formula in description", description: "While you are wearing no armor and not wielding a shield, your Armor Class equals 10 + your Dexterity modifier + your Wisdom modifier." },
        { name: "Unarmored Defense (Constitution)", tags: {chosen_by_class_race: ["barbarian"], chosen_by_player: { playstyle_preference: [], action_preference: [], power_preference: [], requirements: { stats: [ {stat: nil, minimum: nil} ], skills: [ {skill: nil, minimum: nil} ], class: [ {includes: [], excludes: [] } ], race: [ {includes: [], excludes: [] } ] } } }, roll: "see formula in description", description: "While you are not wearing any armor, your Armor Class equals 10 + your Dexterity modifier + your Constitution modifier. You can use a shield and still gain this benefit." },
        { name: nil, tags: [], roll: nil, description: nil },
        { name: nil, tags: [], roll: nil, description: nil },
        { name: nil, tags: [], roll: nil, description: nil },
        { name: nil, tags: [], roll: nil, description: nil },
        { name: nil, tags: [], roll: nil, description: nil },
        { name: nil, tags: [], roll: nil, description: nil },
        { name: nil, tags: [], roll: nil, description: nil }
        ]
    },

    system_spells: {},

    system_unique: [
        "class",
        "race",
        "hit points", 
        "armor class", 
        "alignment", 
        "ability modifiers",
        "output_skill_preferences"
    ],

    unique_snippet_sources: [
        "alignment"
    ],

    stat_conversions: {
        base_output_conversions: "1_to_1",
        term_conversions: [
        { base: { stat1: "strength", stat2: nil}, output: { stat1: "strength", stat2: nil} },
        { base: { stat1: "dexterity", stat2: nil}, output: { stat1: "dexterity", stat2: nil} },
        { base: { stat1: "constitution", stat2: nil}, output: { stat1: "constitution", stat2: nil} },
        { base: { stat1: "intelligence", stat2: nil}, output: { stat1: "intelligence", stat2: nil} },
        { base: { stat1: "wisdom", stat2: nil}, output: { stat1: "wisdom", stat2: nil} },
        { base: { stat1: "charisma", stat2: nil}, output: { stat1: "charisma", stat2: nil} },
        { base: { stat1: nil , stat2: nil   }, output: { stat1: nil , stat2: nil  }  } ,
        { base: { stat1: nil , stat2: nil   }, output: { stat1: nil , stat2: nil  }  } ,
        { base: { stat1: nil , stat2: nil   }, output: { stat1: nil , stat2: nil  }  } ,
        { base: { stat1: nil , stat2: nil   }, output: { stat1: nil , stat2: nil  }  } ,
        { base: { stat1: nil , stat2: nil   }, output: { stat1: nil , stat2: nil  }  } ,
        { base: { stat1: nil , stat2: nil   }, output: { stat1: nil , stat2: nil  }  }
        ],

        chosen_by_class_race: {
        classes: [
            { name: nil, list: [] },
            { name: nil, list: [] },
            { name: nil, list: [] },
            { name: nil, list: [] },
            { name: nil, list: [] },
            { name: nil, list: [] },
            { name: nil, list: [] },
            { name: nil, list: [] },
            { name: nil, list: [] },
            { name: nil, list: [] },
            { name: nil, list: [] },
            { name: nil, list: [] }
        ],
        races: [ 
            { name: "dragonborn", list: [ {stat: "strength", bonus: 2}, {stat: "charisma", bonus: 1}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil} ] },
            { name: "dwarf", list: [ {stat: "constitution", bonus: 2}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil} ] },
            { name: "elf", list: [ {stat: "dexterity", bonus: 2}, {stat: "charisma", bonus: 1}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil} ] },
            { name: "gnome", list: [ {stat: "intelligence", bonus: 2}, {stat: "charisma", bonus: 1}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil} ] },
            { name: "half-elf", list: [ {stat: "charisma", bonus: 2}, {stat: "dexterity", bonus: 1}, {stat: "wisdom", bonus: 1}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil} ] },
            { name: "halfling", list: [ {stat: "dexterity", bonus: 2}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil} ] },
            { name: "half-orc", list: [ {stat: "strength", bonus: 2}, {stat: "constitution", bonus: 1}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil} ] },
            { name: "human", list: [ {stat: "strength", bonus: 1}, {stat: "dexterity", bonus: 1}, {stat: "constitution", bonus: 1}, {stat: "intelligence", bonus: 1}, {stat: "wisdom", bonus: 1}, {stat: "charisma", bonus: 1} ] },
            { name: "tiefling", list: [ {stat: "charisma", bonus: 2}, {stat: "intelligence", bonus: 1}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil} ] },
            { name: nil, list: [ {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil} ] },
            { name: nil, list: [ {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil} ] },
            { name: nil, list: [ {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil} ] },
        ]
        }
    },


    skill_conversions: {
        base_output_conversions: "1_to_2",
        term_conversions: [
        { base: {skill1: "athletics_dodge" , skill2: nil}, output: {skill1: "acrobatics", skill2: nil} },
        { base: {skill1: "awareness" , skill2: nil}, output: {skill1: "perception", skill2: "nature"} },
        { base: {skill1: "deception" , skill2: nil}, output: {skill1: "deception", skill2: nil} },
        { base: {skill1: "feats_of_strength" , skill2: nil}, output: {skill1: "athletics", skill2: "survival"} },
        { base: {skill1: "intimidation" , skill2: nil}, output: {skill1: "intimidation", skill2: nil} },
        { base: {skill1: "investigation" , skill2: nil}, output: {skill1: "investigation", skill2: "history"} },
        { base: {skill1: "larceny_crime" , skill2: nil}, output: {skill1: "sleight_of_hand", skill2: "medicine"} },
        { base: {skill1: "magic_computer" , skill2: nil}, output: {skill1: "arcana", skill2: "religion"} },
        { base: {skill1: "performance" , skill2: nil}, output: {skill1: "performance", skill2: nil} },
        { base: {skill1: "persuasion" , skill2: nil}, output: {skill1: "persuasion", skill2: nil} },
        { base: {skill1: "socialize" , skill2: nil}, output: {skill1: "insight", skill2: "animal_handling"} },
        { base: {skill1: "stealth" , skill2: nil}, output: {skill1: "stealth", skill2: nil} }
        ],
        
        chosen_by_class_race: {
        classes: [
            { name: "barbarian", num_chosen: 2, list: [] },
            { name: "bard", num_chosen: 3, list: [ {skill: "performance", bonus: 1}, {skill: "persuasion", bonus: 1}, {skill: "intimidation", bonus: 1}, {skill: "insight", bonus: 1}, {skill: "perception", bonus: 1}, {skill: "deception", bonus: 1} ] },
            { name: "cleric", num_chosen: 2, list: [] },
            { name: "druid", num_chosen: 2, list: [] },
            { name: "fighter", num_chosen: 2, list: [ {skill: "animal_handling", bonus: 1}, {skill: "athletics", bonus: 1}, {skill: "intimidation", bonus: 1}, {skill: "nature", bonus: 1}, {skill: "perception", bonus: 1}, {skill: "survival", bonus: 1} ] },
            { name: "monk", num_chosen: 2, list: [] },
            { name: "paladin", num_chosen: 2, list: [] },
            { name: "ranger", num_chosen: 3, list: [] },
            { name: "rogue", num_chosen: 4, list: [ {skill: "acrobatics", bonus: 1}, {skill: "athletics", bonus: 1}, {skill: "deception", bonus: 1}, {skill: "intimidation", bonus: 1}, {skill: "investigation", bonus: 1}, {skill: "stealth", bonus: 1}, {skill: "sleight_of_hand", bonus: 1}, {skill: "perception", bonus: 1}, {skill: "persuasion", bonus: 1}, {skill: "insight", bonus: 1} ] },
            { name: "sorcerer", num_chosen: 2, list: [] },
            { name: "warlock", num_chosen: 2, list: [] },
            { name: "wizard", num_chosen: 2, list: [ {skill: "arcana", bonus: 1}, {skill: "history", bonus: 1}, {skill: "insight", bonus: 1}, {skill: "investigation", bonus: 1}, {skill: "medicine", bonus: 1}, {skill: "religion", bonus: 1} ] },
        ],
        races: [
            { name: nil, list: [] },
        ]
        }
    },

    class_conversions: {
        fighter: {
        playstyles: ["physical"],
        hit_die: "d10",
        saving_throws: "strength, constitution",
        equipment: "greatsword, chainmail, explorer's pack, two handaxes"
        }
    }

)








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
    very_beginning: ["Birthed by an ironworker in an imperial steelmill during crunch-week for greatsword production, they were born with the smell of smelting metal in their nose and a fine coating in their lungs."],
    near_beginning: ["The first time they touched a sword was at two weeks old, and at two months they had the strength to master using a knife at the kitchen table. At two years they were babysat by squires who allowed swords to be used as toys, and by age twelve they mastered the blade--and became knighted."],
    middle: ["Part of their oath is to only wield swords taller than they are--and they're pretty tall! Like 6-foot-something, at least.", "A fine military career was in the making, but they set off in search of a fabled swordsmith, who had already died by the time they found the old man's mountain workshop. Their athletic climb up the mountain was not wasted, though, and they continued to train in solitude."],
    near_end: ["They now seek a new as-of-yet undiscovered swordsmith master, who will craft an unbreakable sword of unrivaled sharpness--a perfect companion to a warrior with unbreakable constitution."],
    very_end: ["Due to their obsession with infinite levels of constitution and unkillability, they sleep (and shower) in their full armor, and they tend to reek--remember to do laundry before any stealth missions!"]
}


smooth_talking_ninja = {
    very_beginning: ["Raised by a clan of silent monks who secretly trained as ninja, they internalized the raw power of both sound and silence from an early age."],
    near_beginning: ["They struck out in order to travel the world, and along the way, found themself in dark corners of the world--like forests at night, stowing away in the hull of a stinky ship, and probably being thrown into a castle dungeon at least once or twice."],
    middle: ["They mastered the dexterity to be part of the night itself--first by donning a fine black suit and being a socialite, then by adding a Batman-like cowl to said suit and skulking around, and finally doing both at the same time. And now it's all the time.", "Instead of throwing weapons, they threw words--mellifluous words like falling flower blossoms, and vitriolic words that cut deeper than any blade or shuriken. But sweet or harsh, their timing with witty one-liners is impeccable."],
    near_end: ["Now, they seek to use their talents for stealth and charisma infiltrate the highest echelons on polite, proper, and royal society--either by talking their way in, or sneaking. Either way, they can make a quick escape in the event of any embarrassing social foibles."],
    very_end: ["Seriously though, they love that Batman cowl. It makes them feel like a real ninja. No idea if they have a grappling hook, or any other useful gear, but they for sure have that cowl."]
}


corn_god_worshipping_wizard = {
    very_beginning: ["Born in a barn on a farm far away, corn is all they have ever known. Maybe it's some kind of magical foreign corn? No one has any idea. The place might not even be real."],
    near_beginning: ["The corn has spoken to them, directly into the core of their wisdom, and has revealed the light and truth: the only true god is the Corn God, and they serve this god faithfully. So they set off on a pilgrimage, seeking avatars of this sacred corn in other lands."],
    middle: ["Along their journey, real magic came to them accidentally. Who knew that book would be full of step-by-step spell tutorials? Thankfully, they had the intelligence to correctly interpret it.", "Naturally, they interpreted their power as a gift from their god. They must invoke the god's name when casting any spell now--it might be a compulsion, or religion dogma, or actually part of the spells, but it's gotta happen."],
    near_end: ["Their pilgrimage has brought them to a new land, but no corn that represents the Corn God has been found. They continue searching, perhaps in vain."],
    very_end: ["By the way, they won't eat any corn. They will, however, gladly eat dirt that corn has grown in."]
}


the_mime = {
    very_beginning: ["As if from another world, a melody from some unknown music has always faintly played in their head, even since birth: 'the sound...of silence...'"],
    near_beginning: ["They discovered their magic could be invoked through gestures, and made more powerful by silence--and so, in becoming a mime, they have increased their magical powers tenfold. (Not sure what their starting point was, though.) They have traveled for many years without speaking, at least in public."],
    middle: ["At one point, they became a court jester for a small kingdom's ruler, and perfected the charisma imparted by motley makeup and flamboyant style. They stuck with black-and-white stripes for clothes, and colorful diamonds for face makeup.", "The one time someone heard them speak in their natural voice, they immediately killed them in an alley--or so the rumor goes."],
    near_end: ["What drives them to wander about, giving their performance, waving their hands, weaving their spells? The people. But they never seem to make or keep any friends or lovers along the way...seems like a lonely existence. And yet, they continue on for that simple reason: the people."],
    very_end: ["(Yes, the hushed words on the street about them murdering someone are true.)"]
}


misc_snippets = {
  very_beginning: [
      "Born in an underground cult (seriously, like, mole-people underground), they were worshipping the various idols of the cult since they had motor skills.",
      "The winter winds of the north could not stop a mighty mammoth-herder from coming south, and that is how they came to be in this land--born in a pile of mammoth-fur, with the constitution of a mammoth too.",
      "Legends tell of undersea worlds encapsulated in giant magical bubbles--the legends don't mention anyone ever coming to the surface as proof, but they still claim to come from an underwater kingdom anyway.",
      "Are there other dimensions? Who knows--but they're certainly not from this one, and whoever sent them here has the wisdom to not speak up.",
      "The dense jungles do not allow many to enter, but those who do often leave with a gift--not for themselves, but for their children, who flourish with the jungle's power. They were born to such a destiny.",
  ],
  near_beginning: [
      "Eventually, they were forced to come to the surface as a teenager. Since then, they have struggled to navigate this new sun-drenched world, but they've long since adapted to life here.",
      "Empowered with a natural resistance to the cold, they honed their strength climbing innumerable mountains, and surviving amongst the treacherous flora and predatory fauna.",
      "Water carries magic in this world, and their supposed watery origin seems to be tied to their own magical powers.",
      "Their power has come to them in powerful and terrifying visions, where beings from other worlds (supposedly) impart skills directly into their eyeballs. The eyeballs do seem to be intact, though.",
      "Their gift of dexterity manifested in a dense city, reminiscent of the gift's jungle origin, and saved them as they were forced to flee from a posse of un-bribe-able city guards.",  
  ],
  middle: [
      "At one point, they tried to channel their experiences into painting--using dark colors, painting night scenes, and focusing deeply on shadow. Their paintings were not popular, but did help focus their power in a dark direction.",
      "Their most dangerous test came at the peak of their journey, alone in a land riddled with vampires--there, they discovered their love of fighting off fifty foes at once, and they indeed possess the strength and constitution to do so.",
      "Traveling town to town, they would give performance after performance--but with no home to call their own, they found themself perpetually an outcast, and eventually accepted being a reject from society along with the wisdom that brings.",
      "They were once part of a dragon-slaying party, but decided to steal a piece of treasure for themself and run for it once the dragon started fighting back. They don't regret it.",
      "They have long served as a mercenary for mad sorcerers and warlocks, watching over their twisted magical experiments and fighting off any unwelcome demonic guests.",
  ],
  near_end: [
      "Now, they seek adventure that will take them to the utter heart of darkness--a demon lair would be nice, or some sort of portal to Hell. They're not picky.",
      "Most recently, a trusted fortuneteller has informed them to seek adventure with a group of other similarly-destined folk, but they await their opportunity to backstab their friends and claim all riches and glory for themself.",
      "They live a life of almost non-stop stealth, but have recently discovered the power of teaming up with others to overcome strong foes--especially when they're the only stealthy one.",
      "Bounty-hunting is what eventually brought them here, but a last-minute plea has caused them to reconsider their bounty-hunting ways, and seek out a greater purpose in life.",
      "Ultimately, they seek the power to breathe underwater, and finally have the constitution to reach that magical underwater kingdom on their own.",
  ],
  very_end: [
      "Occasionally, they go howl at the full moon just to see if they can transform into a werewolf...but they can't. They just can't. Sorry.",
      "For a hulking monster, they actually look surprisingly un-terrifying. Don't try to terrorize people, it's a bad look.",
      "Their greatest treasure is a small gold coin with a lewd picture etched into it--DO NOT LOSE IT!",
      "They've done a good job of keeping down their urge to burn things...but it's only a matter of time...",
      "They are easily startled by cats.",
  ]
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
    filter_words = ["a", "an", "the", "and",
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
        if TAG_LIST.add?(tag)
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





# def generate_snippet_pool(output_character)
#     # refactor to only grab ids based on SystemTag joins
#     all_tags = Tag.all
#     tag_dictionary = generate_tag_dictionary(all_tags)
#     search_pool = generate_search_pool(output_character)
#     snippet_pool = fetch_snippet_pool(tag_dictionary, search_pool)
# end


# # THIS WILL BE A VERY SLOW METHOD! DO UNIT TESTING HERE!
# # (try to design frontend to run this during, like, card animations or something to not slow down app...)
# def generate_tag_dictionary(all_tags)
#     # byebug
#     tag_dictionary = {}
#     all_tags.each do |tag|
#         first_letter = tag.text.slice(0, 1)
#         if !tag_dictionary.has_key?(first_letter)
#             tag_dictionary[first_letter] = []
#         end
#         tag_dictionary[first_letter] << tag
#     end
#     # byebug
#     tag_dictionary
# end


# def generate_search_pool(output_character)
#     # SEE IF YOU CAN ALSO USE THE  playstyle_preference + form text  TO ALSO ADD TO POOL!
#     #
#     # refactor to lookup GameSystem with output_character[:game_system_id], and grab game_system[:unique_snippet_sources]
#     unique_system_sources = $game_system_unique_snippet_sources || []
#     string_pool = ""

#     output_character.each do |key, value|
#         if key == :class
#             string_pool += " #{output_character[:class]}"

#         elsif key == :race
#             string_pool += " #{output_character[:race]}"

#         elsif key == :archetype_name
#             string_pool += " #{output_character[:archetype_name]}"

#         elsif key == :skills
#             output_character[:skills][:list].each do |skill_hash|
#                 if skill_hash[:name]
#                     string_pool += " #{skill_hash[:name]}"
#                 end
#             end

#         # take :name and 1st sentence ONLY of :description
#         elsif key == :powers
#             output_character[:powers][:list].each do |power_hash|
#                 if power_hash[:name]
#                     sentence = power_hash[:description].split(". ")[0]
#                     string_pool += " #{power_hash[:name]} #{sentence}"
#                 end
#             end

#         elsif unique_system_sources.length > 0
#             unique_system_sources.each do |string|
#                 key = string.to_sym
#                 string_pool += " #{output_character[:key]}"
#             end
#         end
        
#     end

#     search_pool = generate_tags(string_pool)
    
# end


# def fetch_snippet_pool(tag_dictionary, search_pool)
#     # compare tag_dictionary verses search_pool to narrow down character-specific tags
#             # snippet_list = tag_dictionary.map do |tag|
#             #     tag.snippets.where(system_specific: nil)
#             # end

            
#     # not sure why multiples of snippets are ending up in snippet_pool - investigate!!
#     snippet_pool = Set[] 
#     # snippet_pool = []

#     search_pool.each do |search_string|
#         key = search_string.slice(0, 1)
#         if tag_dictionary.has_key?(key)
#             tag_dictionary[key].each do |tag_hash|
#                 if tag_hash[:text] == search_string
#                     tag_hash.snippets.each do |snippet|
#                         snippet_pool << snippet
#                     end
#                 end
#             end
#         end 
#     end
    
#     sort_snippets_story_location(snippet_pool)
# end


# def sort_snippets_story_location(snippet_pool)
#     sorted_snippet_pool = {
#         "very_beginning": [],
#         "near_beginning": [],
#         "middle": [],
#         "near_end": [],
#         "very_end": []
#     }
#     snippet_pool.each do |snippet_hash|
#         story_location = snippet_hash[:story_location].to_sym
#         sorted_snippet_pool[story_location] << snippet_hash[:text]
#     end    
#     generate_character_backstory(sorted_snippet_pool)
# end


# def generate_character_backstory(sorted_snippet_pool)
#     character_backstory = {
#         "very_beginning": "",
#         "near_beginning": "",
#         "middle": "",
#         "near_end": "",
#         "very_end": "" 
#     }
#     sorted_snippet_pool.each do |story_location, snippet_array|
#         random_index = (rand * snippet_array.length).floor
#         character_backstory[story_location] = snippet_array[random_index]
#     end
#     character_backstory
#     byebug
# end


parse_snippet_lists(big_sword_knight)
parse_snippet_lists(smooth_talking_ninja)
parse_snippet_lists(corn_god_worshipping_wizard)
parse_snippet_lists(the_mime)

parse_snippet_lists(misc_snippets)

# generate_snippet_pool(output_character1)
# generate_snippet_pool(output_character2)