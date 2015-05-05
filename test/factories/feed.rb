FactoryGirl.define do
  factory :ruby_weekly, class: Feed do
    title 'Ruby Weekly'
    url 'http://rubyweekly.com/rss'

    after :create do |feed, _|
      create(:ruby_weekly_entry, feed: feed)
    end
  end

  factory :javascript_weekly, class: Feed do
    title 'JavaScript Weekly'
    url 'http://javascriptweekly.com/rss'

    after :create do |feed, _|
      create(:javascript_weekly_entry, feed: feed)
    end
  end
end
