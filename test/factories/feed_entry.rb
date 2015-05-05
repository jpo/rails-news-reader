FactoryGirl.define do
  factory :ruby_weekly_entry, class: FeedEntry do
    title 'Rails 99 released today!'
    summary 'Go get it now!'
    url 'http://rubyonrails.org'
    published { Time.now }
  end

  factory :javascript_weekly_entry, class: FeedEntry do
    title 'ES99 released today!'
    summary 'Go get it now!'
    url 'http://www.ecma-international.org/'
    published { Time.now }
  end
end
