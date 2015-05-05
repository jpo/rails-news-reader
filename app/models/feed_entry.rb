##
# Represents a category for a RSS feed.
#
class FeedEntry < ActiveRecord::Base
  belongs_to :feed
  attr_accessible :title, :summary, :url, :published
  validates :title, :summary, :url, :published, presence: true
end
