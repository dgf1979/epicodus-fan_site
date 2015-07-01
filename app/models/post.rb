class Post  < ActiveRecord::Base
  validates :user, :presence => true
  validates :title, :presence => true
  has_many :reviews
  def formatted_time
    return self.created_at.in_time_zone("Pacific Time (US & Canada)").strftime("%A, %B %d at %I:%M %p  %Z")
  end
end
