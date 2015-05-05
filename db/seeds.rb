# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(
  email:      'demo@example.com',
  password:   'password',
  first_name: 'Josh',
  last_name:  'O\'Rourke'
)

user.confirm!

feed_categories = FeedCategory.create([
  { name: 'Ruby',       priority: 1 },
  { name: 'JavaScript', priority: 2 },
  { name: 'Mobile',     priority: 3 },
  { name: 'Go',         priority: 4 }
])

Feed.create([
  {
    category: feed_categories.find { |f| f.name == 'Ruby' },
    title:    'JavaScript Weekly',
    url:      'http://rubyweekly.com/rss/1aj3h5dh'
  },
  {
    category: feed_categories.find { |f| f.name == 'JavaScript' },
    title:    'JavaScript Weekly',
    url:      'http://javascriptweekly.com/rss/1f1pmglo'
  },
  {
    category: feed_categories.find { |f| f.name == 'JavaScript' },
    title:    'Node Weekly',
    url:      'http://nodeweekly.com/rss/185fobn3'
  },
  {
    category: feed_categories.find { |f| f.name == 'Go' },
    title:    'Go Weekly',
    url:      'http://golangweekly.com/rss/1ih3a692'
  },
  {
    category: feed_categories.find { |f| f.name == 'Mobile' },
    title:    'Mobile Weekly',
    url:      'http://mobilewebweekly.co/rss/1jg6n24i'
  }
])
