class NewsController < ApplicationController
  before_filter :authenticate_user!

  def index
    if FeedSubscription.subscriber?(current_user)
      @categories = FeedSubscription.find_all_or_subscribed_categories(current_user)
      render :index
    else
      render :empty
    end
  end

  def show
    @categories = FeedSubscription.find_all_or_subscribed_categories(current_user)
    render :index
  end

  def entries
    if params[:id]
      @entries = FeedSubscription.find_recent_entries_by_category(params[:id])
    else
      @entries = FeedSubscription.find_recent_entries(current_user)
    end

    render layout: false
  end
end
