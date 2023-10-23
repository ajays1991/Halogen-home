class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :file_id, :metadata
  attribute :account
end
