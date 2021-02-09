class MovieChoiceSerializer < ActiveModel::Serializer
  attributes :id, :list, :movie
  belongs_to :movie
end
