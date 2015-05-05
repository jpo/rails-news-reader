class News::SubscriptionsController < ApplicationController
  before_filter :authenticate_user!
  helper_method :subscribed?

  def show
    @categories = FeedCategory.order('name').all
    @subscribed = FeedSubscription.find_subscribed_categories(current_user)
  end

  def update
    categories = params[:categories] || {}

    categories.each do |id, selected|
      if selected.to_bool
        FeedSubscription.subscribe!(current_user, id.to_i)
      else
        FeedSubscription.unsubscribe!(current_user, id.to_i)
      end
    end

    flash[:success] = t('news.update.success')
    redirect_to news_index_url
  end

  private

  # Checks whether the current user is subscribed to the given category_id
  def subscribed?(category_id)
    FeedSubscription.subscribed?(current_user, category_id.to_i)
  end
end
