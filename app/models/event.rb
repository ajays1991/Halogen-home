class Event < ApplicationRecord
	update_index('events#event') { self }
end
