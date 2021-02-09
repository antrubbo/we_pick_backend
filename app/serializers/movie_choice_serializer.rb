class MovieChoiceSerializer < ActiveModel::Serializer
  attributes :id, :movie
  belongs_to :movie
end
