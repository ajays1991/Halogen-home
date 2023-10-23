class Profile < ApplicationRecord
  belongs_to :tutor, :class_name => 'User', :foreign_key => 'user_id', optional: true  
  has_many :profiles_languages
  has_many :languages, through: :profiles_languages

  before_save :set_user

  def set_user
    self.user_id = Current.attributes[:user][:id]
  end
end