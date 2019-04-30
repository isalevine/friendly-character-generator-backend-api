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

# playstyles: physical, mental, social
# actions: [weapon, tank, sneak, spells], [spells, investigate, knowledge], [leader, perform, manipulate, seduce]
# ??? DEPRECATE for only PLAYSTYLE and ACTIONS as search terms ???  stats: strength, stamina, dexterity, wisdom, intelligence, charisma
# powers: any, damage, heal, stealth, mind, control

warrior = Archetype.create(name: "Warrior")
warrior_search_list = SearchList.create(archetype_id: warrior.id, search_playstyle_pref: "physical", search_action_pref: "weapon, tank", search_power_pref: "any")

ninja = Archetype.create(name: "Ninja")
ninja_search_list = SearchList.create(archetype_id: ninja.id, search_playstyle_pref: "physical, mental", search_action_pref: "sneak, investigate", search_power_pref: "any")

wizard = Archetype.create(name: "Wizard")
wizard_search_list = SearchList.create(archetype_id: wizard.id, search_playstyle_pref: "physical, mental", search_action_pref: "spells, knowledge", search_power_pref: "any")

seducer = Archetype.create(name: "Seducer")
seducer_search_list = SearchList.create(archetype_id: seducer.id, search_playstyle_pref: "social", search_action_pref: "leader, perform, manipulate, seduce", search_power_pref: "any")
