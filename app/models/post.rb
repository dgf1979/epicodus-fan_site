class Post  < ActiveRecord::Base
  validates :user, :presence => true
  validates :title, :presence => true
  has_many :reviews
  def formatted_time
    return self.created_at.in_time_zone("Pacific Time (US & Canada)").strftime("%A, %B %d at %I:%M %p  %Z")
  end

  def average_review_score
    result = self.reviews.average(:rating)
    if result.is_a? Numeric
      return result.round
    else
      return 1
    end
  end

  def posterURL
    input = self.title.sub(" ", "+")
    response = HTTParty.get("http://www.omdbapi.com/?t=#{input}&y=&plot=short&r=json")
    return response.parsed_response["Poster"]
  end

  def self.Search(searchString)
    result = self.basic_search(title: searchString)
    if result.kind_of?(Array)
      return result
    else
      return []
    end
  end
end
