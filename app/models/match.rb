class Match < ActiveRecord::Base
  belongs_to :friendee, class_name: "User"
  belongs_to :friender, class_name: "User"

  def self.find_record(user1, user2)
    matches = []
    matches << Match.where(friendee_id: user1.id, friender_id: user2.id )
    matches << Match.where(friendee_id: user2.id, friender_id: user1.id )
    matches.flatten!
    return matches[0]
  end
end
