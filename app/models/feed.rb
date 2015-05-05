##
# Represents a single RSS feed
#
class Feed < ActiveRecord::Base
  belongs_to :category,
             class_name: FeedCategory,
             foreign_key: :feed_category_id

  has_many :entries,
           class_name: FeedEntry,
           dependent: :destroy

  attr_accessible :title, :url, :category, :category_id

  validates :title, :url, :category, :feed_category_id, presence: true
end
