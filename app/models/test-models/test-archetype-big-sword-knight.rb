# built referencing /notes/test-archetype-big-sword-knight.yml

archetype_big_sword_knight = {
  id: 1,
  name: "big sword knight",

  stat_weights: {
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
      tags: ["sword", "combat", "extra attacks", "accuracy", "strength", "dodge", "reduce damage", "intimidate"]
    }
  },

  system_unique: {
    dnd_5th_001: {
      class: "fighter",
      race: "half-orc",
      hit_points: "roll d10, add Constitution modifier",
      armor_class: "armor base AC, add Dexterity modifier",
      alignment: "chaotic-neutral",
      ability_modifiers: "8-9 = -1; 10-11 = 0; 12-13 = +1; 14-15 = +2; 16-17 = +3, 18-19 = +4"
    },
    exalted_2nd_001: {
      class: "dawn",
      race: "solar exalted",
      anima: "big sword with angel wings",
      backgrounds: "artifact: 3 (daiklave), resources: 3 (armor, traveling gear, and lots of tavern-drinking), manse: 1 (delerium orb - lvl 1 fire stone, grants berserk/combat bonus)",
      virtues: "valor: 4, conviction: 3, temperence: 1, compassion: 1",
      virtue_flaw: "valor - will try to fight and conquer anything bigger than their sword",
      willpower: "7",
      hit_points: "-0: 1, -1: 2, -2: 2, -4: 1, I: 1",
      soak: "bashing: , lethal: , aggravated: ",
      defense_values: "dodge: , parry: , mental: ",
      essence: "level 2, personal: 13 motes, peripheral: 30 motes",
      bonus_points: "18"
    }
  }


}

# to test auto-searching for dnd classes/races, consider how ArchetypeMaker may leave those
# fields in system_unique as nil => handle logic based on that (i.e. call a search method...)
