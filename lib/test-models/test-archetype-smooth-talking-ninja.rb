
$archetype_smooth_talking_ninja = {
  id: 2,
  name: "smooth-talking ninja",

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


}

# to test auto-searching for dnd classes/races, consider how ArchetypeMaker may leave those
# fields in system_unique as nil => handle logic based on that (i.e. call a search method...)
