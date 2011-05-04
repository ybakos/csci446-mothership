class Armada < ActiveRecord::Base

  belongs_to :creator, :class_name => "User"

  def created_by(user)
    creator == user
  end
  
  def creator_name(user)
    creator == user ? 'Me' : creator
  end

  def to_s
  	name
  end
  
end
