class Language < ApplicationRecord
	has_many :bookings
	has_many :profiles_languages
  	has_many :profiles, through: :profiles_languages
end
 