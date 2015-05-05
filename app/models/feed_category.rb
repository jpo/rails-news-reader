##
# Represents a category for a RSS feed.
#
class FeedCategory < ActiveRecord::Base
  has_many :feeds,
           dependent: :destroy

  has_many :entries,
           through: :feeds,
           class_name: FeedEntry,
           dependent: :destroy

  has_and_belongs_to_many :users

  attr_accessible :name, :priority

  validates :name, :priority, presence: true
end
