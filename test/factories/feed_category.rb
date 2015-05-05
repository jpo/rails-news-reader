FactoryGirl.define do
  factory :ruby, class: FeedCategory do
    name 'Ruby'
    priority 1

    after :create do |category, _|
      create(:ruby_weekly, category: category)
    end
  end

  factory :javascript, class: FeedCategory do
    name 'JavaScript'
    priority 2

    after :create do |category, _|
      create(:javascript_weekly, category: category)
    end
  end
end
