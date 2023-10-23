class AssignmentsIndex < BaseSettings

  define_type Assignment.all do
      field :name
      field :account_id
      field :assignment_type_id
      field :metadata, type: 'object'
      field :account, type: 'object'
  end
end