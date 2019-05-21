class SearchPreferenceSerializer < ActiveModel::Serializer
  attributes :id, :stat_preference, :action_preference, :power_preference
end
