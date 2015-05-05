require 'test_helper'

class FeedSubscriptionTest < ActiveSupport::TestCase
  context 'A Nonsubscriber' do
    setup do
      @categories = [create(:ruby), create(:javascript)]
      @subscribed = []
      @user       = create(:josh)
    end

    should 'find all categories' do
      target  = @categories
      results = FeedSubscription.find_all_or_subscribed_categories(@user)
      assert_same_elements target, results
    end

    should 'not find subscribed categories' do
      target  = []
      results = FeedSubscription.find_subscribed_categories(@user)
      assert_same_elements target, results
    end

    should 'find recent entries' do
      target  = @categories.select { |c| c.priority == 1 }
                           .map(&:feeds).flatten
                           .map(&:entries).flatten

      results = FeedSubscription.find_recent_entries(@user)
      assert_same_elements target, results
    end

    should 'find recent entries by category' do
      category = @categories.first
      target   = @categories.select { |c| c.id == category.id }
                            .map(&:feeds).flatten
                            .map(&:entries).flatten

      results  = FeedSubscription.find_recent_entries_by_category(category.id)
      assert_same_elements target, results
    end

    should 'subscribe to a new category' do
      category = @categories.first
      target   = [category]
      FeedSubscription.subscribe!(@user, category.id)
      results  = @user.feed_subscriptions
      assert_same_elements target, results
    end

    should 'not unsubscribe from a category' do
      category = @categories.first
      target   = []
      FeedSubscription.unsubscribe!(@user, category.id)
      results  = @user.feed_subscriptions
      assert_same_elements target, results
    end

    should 'not be subscribed to a category' do
      category = @categories.first
      assert_false FeedSubscription.subscribed?(@user, category.id)
    end

    should 'not be a subscriber' do
      assert_false FeedSubscription.subscriber?(@user)
    end
  end

  context 'A Subscriber' do
    setup do
      @categories   = [create(:javascript), create(:ruby)]
      @subscribed   = [@categories.first]
      @unsubscribed = [@categories.second]
      @user         = create(:josh, feed_subscriptions: @subscribed)
    end

    should 'find only subscribed categories' do
      target  = @user.feed_subscriptions
      results = FeedSubscription.find_all_or_subscribed_categories(@user)
      assert_same_elements target, results
    end

    should 'find subscribed categories' do
      target  = @user.feed_subscriptions
      results = FeedSubscription.find_subscribed_categories(@user)
      assert_same_elements target, results
    end

    should 'find recent entries' do
      target  = @subscribed.map(&:feeds).flatten
                           .map(&:entries).flatten

      results = FeedSubscription.find_recent_entries(@user)
      assert_same_elements target, results
    end

    should 'find recent entries by category' do
      category = @subscribed.first
      target   = @subscribed.select { |c| c.id == category.id }
                            .map(&:feeds).flatten
                            .map(&:entries).flatten

      results  = FeedSubscription.find_recent_entries_by_category(category.id)
      assert_same_elements target, results
    end

    should 'subscribe to a new category' do
      category = @unsubscribed.first
      FeedSubscription.subscribe!(@user, category.id)
      assert @user.feed_subscriptions.any? { |c| c.id == category.id }
    end

    should 'not duplicate a subscription to an existing category' do
      category = @subscribed.first
      target   = [category]
      FeedSubscription.subscribe!(@user, category.id)
      results  = @user.feed_subscriptions.select { |c| c.id == category.id }
      assert_same_elements target, results
    end

    should 'unsubscribe from a subscribed category' do
      category = @subscribed.first
      FeedSubscription.unsubscribe!(@user, category.id)
      assert_false @user.feed_subscriptions.any? { |c| c.id == category.id }
    end

    should 'not unsubscribe from an unsubscribed category' do
      category = @unsubscribed.first
      target   = @subscribed
      FeedSubscription.unsubscribe!(@user, category.id)
      results  = @user.feed_subscriptions
      assert_same_elements target, results
    end

    should 'be subscribed to a category' do
      category = @subscribed.first
      assert FeedSubscription.subscribed?(@user, category.id)
    end

    should 'be a subscriber' do
      assert FeedSubscription.subscriber?(@user)
    end
  end
end
