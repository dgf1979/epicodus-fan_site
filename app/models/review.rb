class Review  < ActiveRecord::Base
  validates :user, :presence => true
  validates :content, :presence => true
  validates :rating, :presence => true
  belongs_to :posts
end
