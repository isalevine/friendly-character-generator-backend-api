
$archetype_the_mime = {
  id: 4,
  name: "the_mime",

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


}

# to test auto-searching for dnd classes/races, consider how ArchetypeMaker may leave those
# fields in system_unique as nil => handle logic based on that (i.e. call a search method...)
