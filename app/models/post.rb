class Post  < ActiveRecord::Base
  validates :user, :presence => true
  validates :title, :presence => true
end
