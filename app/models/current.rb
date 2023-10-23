class Current < ActiveSupport::CurrentAttributes
  attribute :user

  # def user=(user)
  #   super
  #   self.user = User.find(user[:id])
  # end
end
