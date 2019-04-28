class SearchPreferenceSerializer < ActiveModel::Serializer
  attributes :id, :base_character_id, :stat_preference, :action_preference, :power_preference
end
