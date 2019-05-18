
$archetype_corn_god_worshipping_wizard = {
  id: 3,
  name: "corn-god-worshipping wizard",

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


}

# to test auto-searching for dnd classes/races, consider how ArchetypeMaker may leave those
# fields in system_unique as nil => handle logic based on that (i.e. call a search method...)
