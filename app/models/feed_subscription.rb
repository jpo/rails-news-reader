##
# A service class that manages subscriptions to RSS feed categories for
# subscribers and non-subscribers.
#
class FeedSubscription
  # #
  # Finds all feed categories if the user is not a subscriber. If the user is a
  # subscriber, only find subscribed categories.
  #
  def self.find_all_or_subscribed_categories(user)
    if self.subscriber?(user)
      user.feed_subscriptions.order('name')
    else
      FeedCategory.order('name')
    end
  end

  ##
  # Finds the feed categories that a user is subscribed to.
  #
  def self.find_subscribed_categories(user)
    user.feed_subscriptions.order('name')
  end

  ##
  # Find the most recent entries for a given user across all categories.
  #
  def self.find_recent_entries(user)
    if self.subscriber?(user)
      query = FeedEntry.joins(feed: { category: :users })
                       .where(users: { id: user.id })
    else
      query = FeedEntry.joins(feed: :category)
                       .where(feed_categories: { priority: 1 })
    end

    query.limit(25).order('published desc').all.uniq(&:url).take(10)
  end

  ##
  # Finds the most recent entries for a category
  #
  def self.find_recent_entries_by_category(category_id)
    FeedEntry.joins(feed: :category)
             .where(feed_categories: { id: category_id })
             .order('published desc')
             .limit(25)
             .all
             .uniq(&:url)
             .take(10)
  end

  ##
  # Subscribes a user a category_id if the user is not already subscribed.
  #
  def self.subscribe!(user, category_id)
    unless self.subscribed?(user, category_id)
      category = FeedCategory.find_by_id(category_id)
      user.feed_subscriptions << category if category
    end
  end

  ##
  # Unsubscribes a user from category_id if the user is subscribed.
  #
  def self.unsubscribe!(user, category_id)
    if self.subscribed?(user, category_id)
      user.feed_subscriptions.destroy(category_id)
    end
  end

  ##
  #  Indicates whether or not a user is subscribed to a category
  #
  def self.subscribed?(user, category_id)
    user.feed_subscriptions.any? { |s| s.id == category_id }
  end

  ##
  # Indicates whether or not a user is subscribed to any category
  #
  def self.subscriber?(user)
    user.feed_subscriptions.any?
  end
end
