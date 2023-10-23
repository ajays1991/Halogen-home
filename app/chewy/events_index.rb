class EventsIndex < Chewy::Index
  settings analysis: {
    analyzer: {
      email: {
        tokenizer: 'keyword',
        filter: ['lowercase']
      }
    }
  }

  define_type Event.all do
      field :account
      field :event_type, analyzer: 'email'
      field :address, type: 'object'
      field :meta, type: 'object'
      field :identifier, type: 'object'
  end
end