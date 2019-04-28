class BaseCharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :archetype_id, :search_preference_id
end
