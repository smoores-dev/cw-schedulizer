class NewsStory < ActiveRecord::Base
  validates :title, :snippet, :url, presence: true
end
