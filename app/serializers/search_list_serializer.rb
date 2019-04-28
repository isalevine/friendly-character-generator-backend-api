class SearchListSerializer < ActiveModel::Serializer
  attributes :id, :archetype_id, :search_stat_pref, :search_action_pref, :search_power_pref
end
