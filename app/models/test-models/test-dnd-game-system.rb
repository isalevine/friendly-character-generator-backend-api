# built referencing /notes/test-dnd-game-system.yml

# Thieves' Cant currently changed to remove \' - attempting to color-correct strings in Powers


$dnd_game_system = {

  id: 1,
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
    max_player_score: nil,
    max_class_race_score: nil,
    stat_num: 6,
    stat_list: ["strength", "dexterity", "constitution", "intelligence", "wisdom", "charisma", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
  },

  system_skills: {
    skill_alias: "skill",
    has_skills: true,
    chosen_by: "both",
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
    skill_num: 18,
    skill_list: ["acrobatics", "animal handling", "arcana", "athletics", "deception", "history", "insight", "intimidation", "investigation", "medicine", "nature", "perception", "performance", "persuasion", "religion", "sleight of hand", "stealth", "survival", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
  },

  system_powers: {
    power_alias: "feature",
    has_powers: true,
    chosen_by: "class/race",
    starting_num: 3,
    power_num: 23,
    power_list: [
      { name: "Arcane Recovery", tags: ["wizard"], roll: "once per day", description: "You have learned to regain some of your magical energy by studying your spellbook. Once per day when you finish a short rest, you can choose expended spell slots to recover. You can recover either a 2nd-level spell slot or two 1st-level spell slots."},
      { name: "Bardic Inspiration", tags: ["bard"], roll: "d6", description: "You can inspire others through stirring words or music. To do so, you use a bonus action on your turn to choose one creature other than yourself within 60 feet of you who can hear you. That creature gains one Bardic Inspiration die, a d6. Once within the next 10 minutes, the creature can roll the die and add the number rolled to one ability check, attack roll, or saving throw it makes. Once the Bardic Inspiration die is rolled, it is lost. A creature can have only one Bardic Inspiration die at a time." },
      { name: "Bonus Proficiency", tags: [""], roll: "automatic", description: "When you choose this domain at 1st level, you gain proficiency with heavy armor." },
      { name: "Choose: Dragon Ancestor", tags: [""], roll: "automatic", description: "At 1st level, you choose one type of dragon as your ancestor. The damage type associated with each dragon is used by features you gain later. You can speak, read, and write Draconic. Additionally, whenever you make a Charisma check when interacting with dragons, your proficiency bonus is doubled if it applies to the check." },
      { name: "Choose: Expertise 1 (skill or thieves tools)", tags: [""], roll: "double proficiency bonus", description: "At 1st level, choose two of your skill proficiencies, or one of your skill proficiencies and your proficiency with thieves tools. Your proficiency bonus is doubled for any ability check you make that uses either of the chosen proficiencies." },
      { name: "Choose: Fighting Style", tags: ["fighter"], roll: "automatic", description: "You adopt a particular style of fighting as your specialty. Choose one of the following options: Archery, Defense, Dueling, Great Weapon Fighting, Protection, or Two-Weapon Fighting. You can’t take a Fighting Style option more than once, even if you later get to choose again." },
      { name: "Divine Domain", tags: ["cleric"], roll: "automatic", description: "Choose one domain related to your deity: Knowledge, Life, Light, Nature, Tempest, Trickery, or War. Your domain grants you domain spells and other features when you choose it at 1st level. (From Domain Spells 1 Feature:) Each domain has a list of spells—its domain spells— that you gain at the cleric levels noted in the domain description. Once you gain a domain spell, you always have it prepared, and it doesn’t count against the number of spells you can prepare each day." },
      { name: "Divine Sense", tags: ["paladin"], roll: "uses per day: 1 + Constitution modifier", description: "The presence of strong evil registers on your senses like a noxious odor, and powerful good rings like heavenly music in your ears. As an action, you can open your awareness to detect such forces. Until the end of your next turn, you know the location of any celestial, fiend, or undead within 60 feet of you that is not behind total cover. You know the type (celestial, fiend, or undead) of any being whose presence you sense, but not its identity. Within the same radius, you also detect the presence of any place or object that has been consecrated or desecrated, as with the hallow spell. You can use this feature a number of times equal to 1 + your Charisma modifier. When you finish a long rest, you regain all expended uses." },
      { name: "Druidic", tags: ["druid"], roll: "automatic", description: "You know Druidic, the secret language of druids. You can speak the language and use it to leave hidden messages. You and others who know this language automatically spot such a message. Others spot the message's presence with a successful DC 15 Wisdom (Perception) check but can't decipher it without magic." },
      { name: "Favored Enemy (Choose 1)", tags: ["ranger"], roll: "bonus to Wisdom, Intelligence, Survival checks", description: "Beginning at 1st level, you have significant experience studying, tracking, hunting, and even talking to a certain type of enemy. Choose a type of favored enemy: aberrations, beasts, celestials, constructs, dragons, elementals, fey, fiends, giants, monstrosities, oozes, plants, or undead. You have advantage on Wisdom (Survival) checks to track your favored enemies, as well as on Intelligence checks to recall information about them." },
      { name: "Lay On Hands", tags: ["paladin"], roll: "restore hit points", description: "Your blessed touch can heal wounds. You have a pool of healing power that replenishes when you take a long rest. With that pool, you can restore a total number of hit points equal to your paladin level × 5. As an action, you can touch a creature and draw power from the pool to restore a number of hit points to that creature, up to the maximum amount remaining in your pool. Alternatively, you can expend 5 hit points from your pool of healing to cure the target of one disease or neutralize one poison affecting it. You can cure multiple diseases and neutralize multiple poisons with a single use of Lay on Hands, expending hit points separately for each one.This feature has no effect on undead and constructs." },
      { name: "Martial Arts", tags: ["monk"], roll: "when only using monk equipment", description: "At 1st level, your practice of martial arts gives you mastery of combat styles that use unarmed strikes and monk weapons, which are shortswords and any simple melee weapons that don’t have the two- handed or heavy property. You gain the following benefits while you are unarmed or wielding only monk weapons and you aren’t wearing armor or wielding a shield: 1) You can use Dexterity instead of Strength for the attack and damage rolls of your unarmed strikes and monk weapons. 2) You can roll a d4 in place of the normal damage of your unarmed strike or monk weapon. 3) When you use the Attack action with an unarmed strike or a monk weapon on your turn, you can make one unarmed strike as a bonus action." },
      { name: "Natural Explorer (1 terrain type)", tags: ["ranger"], roll: "Intelligence or Wisdom check", description: "You are particularly familiar with one type of natural environment and are adept at traveling and surviving in such regions. Choose one type of favored terrain: arctic, coast, desert, forest, grassland, mountain, or swamp. When you make an Intelligence or Wisdom check related to your favored terrain, your proficiency bonus is doubled if you are using a skill that you’re proficient in. While traveling for an hour or more in your favored terrain, you gain the following benefits: 1) Difficult terrain doesn’t slow your group’s travel. 2) Your group can’t become lost except by magical means. 3) Even when you are engaged in another activity while traveling (such as foraging, navigating, or tracking), you remain alert to danger. 4) If you are traveling alone, you can move stealthily at a normal pace. 5) When you forage, you find twice as much food as you normally would. 6) While tracking other creatures, you also learn their exact number, their sizes, and how long ago they passed through the area." },
      { name: "Otherworldly Patron", tags: ["warlock"], roll: "automatic", description: "At 1st level, you have struck a bargain with an otherworldly being of your choice: the Archfey, the Fiend, or the Great Old One, each of which is detailed at the end of the class description." },
      { name: "Pact Magic", tags: ["warlock"], roll: "automatic", description: "Your arcane research and the magic bestowed on you by your patron have given you facility with spells." },
      { name: "Rage", tags: ["barbarian"], roll: "use as bonus action", description: "In battle, you fight with primal ferocity. On your turn, you can enter a rage as a bonus action. While raging, you gain the following benefits if you are not wearing heavy armor: 1) You have advantage on Strength checks and Strength saving throws. 2) When you make a melee weapon Attack using Strength, you gain a +2 bonus to the damage roll. This bonus increases as you level. 3) You have Resistance to bludgeoning, piercing, and slashing damage. Your rage lasts for 1 minute. It ends early if you are knocked Unconscious or if Your Turn ends and you have not attacked a hostile creature since your last turn or taken damage since then. You can also end your rage on Your Turn as a Bonus Action. Once you have raged the maximum number of times for your barbarian level, you must finish a Long Rest before you can rage again." },
      { name: "Second Wind", tags: ["fighter"], roll: "use as bonus action", description: "You have a limited well of stamina that you can draw on to protect yourself from harm. On your turn, you can use a bonus action to regain hit points equal to 1d10 + your fighter level. Once you use this feature, you must finish a short or long rest before you can use it again." },
      { name: "Sneak Attack", tags: ["rogue"], roll: "extra 1d6 damage", description: "Beginning at 1st level, you know how to strike subtly and exploit a foe’s distraction. Once per turn, you can deal an extra 1d6 damage to one creature you hit with an attack if you have advantage on the attack roll. The attack must use a finesse or a ranged weapon. You don’t need advantage on the attack roll if another enemy of the target is within 5 feet of it, that enemy isn’t incapacitated, and you don’t have disadvantage on the attack roll." },
      { name: "Sorcerous Origin", tags: ["sorcerer"], roll: "automatic", description: "Choose a sorcerous origin, which describes the source of your innate magical power: Draconic Bloodline or Wild Magic, both detailed at the end of the class description." },
      { name: "Spellcasting", tags: ["bard", "cleric", "druid", "sorcerer", "wizard"], roll: "automatic", description: "An event in your past, or in the life of a parent or ancestor, left an indelible mark on you, infusing you with arcane magic. This font of magic, whatever its origin, fuels your spells. (NOTE: This feature is used in place of all other Spellcasting features.)" },
      { name: "Thieves Cant", tags: ["rogue"], roll: "automatic", description: "During your rogue training you learned thieves cant, a secret mix of dialect, jargon, and code that allows you to hide messages in seemingly normal conversation. Only another creature that knows thieves cant understands such messages. It takes four times longer to convey such a message than it does to speak the same idea plainly. In addition, you understand a set of secret signs and symbols used to convey short, simple messages, such as whether an area is dangerous or the territory of a thieves guild, whether loot is nearby, or whether the people in an area are easy marks or will provide a safe house for thieves on the run." },
      { name: "Unarmored Defense (Wisdom)", tags: ["monk"], roll: "see formula in description", description: "While you are wearing no armor and not wielding a shield, your Armor Class equals 10 + your Dexterity modifier + your Wisdom modifier." },
      { name: "Unarmored Defense (Constitution)", tags: ["barbarian"], roll: "see formula in description", description: "While you are not wearing any armor, your Armor Class equals 10 + your Dexterity modifier + your Constitution modifier. You can use a shield and still gain this benefit." },
      { name: nil, tags: [], roll: nil, description: nil },
      { name: nil, tags: [], roll: nil, description: nil },
      { name: nil, tags: [], roll: nil, description: nil },
      { name: nil, tags: [], roll: nil, description: nil },
      { name: nil, tags: [], roll: nil, description: nil },
      { name: nil, tags: [], roll: nil, description: nil },
      { name: nil, tags: [], roll: nil, description: nil }
    ]
  },

  system_unique: ["hit points", "armor class", "alignment", "ability modifiers"],



  stat_conversions: {
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
        { name: "half-elf", list: [ {stat: "charisma", bonus: 2}, {stat: "dexterity", bonus: 1}, {stat: "Wisdom", bonus: 1}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil}, {stat: nil, bonus: nil} ] },
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
        { name: "barbarian", num_chosen: nil, list: [] },
        { name: "bard", num_chosen: 3, list: [ {skill: "performance", bonus: 1}, {stat: "persuasion", bonus: 1}, {stat: "intimidation", bonus: 1}, {stat: "insight", bonus: 1}, {stat: "perception", bonus: 1}, {stat: "deception", bonus: 1} ] },
        { name: "cleric", num_chosen: nil, list: [] },
        { name: "druid", num_chosen: nil, list: [] },
        { name: "fighter", num_chosen: 2, list: [ {skill: "animal_handling", bonus: 1}, {stat: "athletics", bonus: 1}, {stat: "intimidation", bonus: 1}, {stat: "nature", bonus: 1}, {stat: "perception", bonus: 1}, {stat: "survival", bonus: 1} ] },
        { name: "monk", num_chosen: nil, list: [] },
        { name: "paladin", num_chosen: nil, list: [] },
        { name: "ranger", num_chosen: nil, list: [] },
        { name: "rogue", num_chosen: 4, list: [ {skill: "acrobatics", bonus: 1}, {stat: "athletics", bonus: 1}, {stat: "deception", bonus: 1}, {stat: "intimidation", bonus: 1}, {stat: "investigation", bonus: 1}, {stat: "stealth", bonus: 1}, {stat: "sleight_of_hand", bonus: 1}, {stat: "perception", bonus: 1}, {stat: "persuasion", bonus: 1}, {stat: "insight", bonus: 1} ] },
        { name: "sorcerer", num_chosen: nil, list: [] },
        { name: "warlock", num_chosen: nil, list: [] },
        { name: "wizard", num_chosen: 2, list: [ {skill: "arcana", bonus: 1}, {stat: "history", bonus: 1}, {stat: "insight", bonus: 1}, {stat: "investigation", bonus: 1}, {stat: "medicine", bonus: 1}, {stat: "religion", bonus: 1} ] },
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

}


# playstyles can be used as default/fallback queries if
# system-specific class is NOT selected in ArchetypeMaker
#
# refereance:
    # {name: "barbarian", playstyles: ["physical"] },
    # {name: "bard", playstyles: ["mental", "social"] },
    # {name: "cleric", playstyles: ["physical", "mental"] },
    # {name: "druid", playstyles: ["mental", "social"] },
    # {name: "fighter", playstyles: ["physical"] },
    # {name: "monk", playstyles: ["physical"] },
    # {name: "paladin", playstyles: ["physical", "social"] },
    # {name: "ranger", playstyles: ["physical", "mental"] },
    # {name: "rogue", playstyles: ["physical", "mental", "social"] },
    # {name: "sorcerer", playstyles: ["physical", "mental"] },
    # {name: "warlock", playstyles: ["mental", "social"] },
    # {name: "wizard", playstyles: ["physical", "mental", "social"] },
