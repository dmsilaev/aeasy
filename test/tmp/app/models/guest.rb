class Guest < ActiveRecord::Base
  def guest?
    true
  end
end
