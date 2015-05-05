require 'test_helper'

class FeedTest < ActiveSupport::TestCase
  context 'A Feed' do
    should belong_to(:category)
    should have_many(:entries)

    should_not allow_mass_assignment_of(:id)
    should allow_mass_assignment_of(:title)
    should allow_mass_assignment_of(:url)
    should allow_mass_assignment_of(:category)
    should allow_mass_assignment_of(:category_id)

    should validate_presence_of(:title)
    should validate_presence_of(:url)
    should validate_presence_of(:category)
    should validate_presence_of(:feed_category_id)
  end
end
